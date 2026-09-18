"""Strict reader for the project's UTF-8, braced-field BibLaTeX subset.

JSON is generated solely to preserve Carter's author-group numbering and the
combined multipart entries. Unsupported syntax is rejected, never silently guessed.
"""
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]

def braced(s, pos):
    assert s[pos]=='{'
    start=pos+1; depth=1; pos+=1
    while pos<len(s) and depth:
        if s[pos]=='\\': pos+=2; continue
        if s[pos]=='{': depth+=1
        elif s[pos]=='}': depth-=1
        pos+=1
    if depth: raise ValueError('Unbalanced BibLaTeX braces')
    return s[start:pos-1],pos

def compile_bibliography(root=ROOT):
    path=root/'references.bib'
    s=re.sub(r'(?m)^%.*$', '', path.read_text())
    pos=0; entries=[]; keys=set()
    while pos<len(s):
        if s[pos].isspace(): pos+=1; continue
        match=re.match(r'@(article|book|incollection|unpublished)\s*',s[pos:])
        if not match: raise ValueError(f'Unsupported bibliography syntax at character {pos}')
        kind=match[1]; pos+=match.end(); body,pos=braced(s,pos)
        key,fields=body.split(',',1); key=key.strip()
        if key in keys: raise ValueError(f'Duplicate key {key}')
        keys.add(key); entry={'key':key,'type':kind}; off=0
        while off<len(fields):
            if fields[off].isspace() or fields[off]==',': off+=1; continue
            match=re.match(r'([a-z]+)\s*=\s*',fields[off:])
            if not match: raise ValueError(f'Unsupported field syntax in {key}')
            name=match[1]; off+=match.end(); value,off=braced(fields,off)
            if name in entry: raise ValueError(f'Duplicate field {name} in {key}')
            entry[name]=value.replace('--','–')
        for required in ['author','title','shorthand']:
            if required not in entry: raise ValueError(f'{key} has no {required}')
        entries.append(entry)
    groups=[]
    for e in entries:
        if not groups or groups[-1]['author_raw']!=e['author']:
            names=[]
            for author in e['author'].split(' and '):
                if ',' in author:
                    family,given=author.split(',',1)
                    names.append(given.strip()+' '+family.strip())
                else:
                    names.append(author)
            display=', '.join(names[:-1])+' and '+names[-1] if len(names)>1 else names[0]
            groups.append({'author_raw':e['author'],'author':display,'works':[]})
        works=groups[-1]['works']; num=int(e['shorthand'])
        if works and works[-1]['number']==num:
            parts = works[-1]['parts']
            roman = ('I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X')
            assert len(parts) < len(roman) and all(
                part.get('part') == roman[i] for i, part in enumerate(parts)
            ) and e.get('part') == roman[len(parts)], f'Invalid part sequence for {e["key"]}'
            assert e['title'] == parts[0]['title'], f'Multipart title mismatch for {e["key"]}'
            works[-1]['parts'].append(e)
        else:
            assert num > 0 and (not works or num > works[-1]['number']), f'Invalid original label for {e["key"]}'
            assert 'part' not in e or e['part'] == 'I', f'First part must be I for {e["key"]}'
            works.append({'number':num,'parts':[e]})
    last_page = 324
    for e in entries:
        page = int(e.get('usera', '324'))
        assert 324 <= page <= 335 and page >= last_page, 'Bibliography provenance must follow original page order'
        e['source_file_page'] = page
        e['source_start'] = page != last_page
        last_page = page
    inventory_path = root/'data/bibliography-inventory.json'
    if inventory_path.exists():
        inventory = json.loads(inventory_path.read_text())
        actual = {g['author_raw']: [w['number'] for w in g['works']] for g in groups}
        assert len(actual) == len(groups), 'An author group is repeated non-contiguously'
        expected = {g['author']: list(range(1,g['last_number']+1))
                    for g in inventory['groups']}
        assert list(actual.items()) == list(expected.items()), 'Bibliography author groups/numbers differ from reviewed source inventory'
        if 'numbered_items_per_source_page' in inventory:
            per_page = {}
            for group in groups:
                for work in group['works']:
                    page = str(work['parts'][0]['source_file_page'])
                    per_page[page] = per_page.get(page, 0) + 1
            assert per_page == inventory['numbered_items_per_source_page'], 'Bibliography source-page counts differ from reviewed inventory'
    result={'source_file':'references.bib','source_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),
            'entries':len(entries),'printed_items':sum(len(g['works']) for g in groups),'groups':groups}
    output = root/'build/.cache/bibliography.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    serialized = json.dumps(result,ensure_ascii=False,indent=2)+'\n'
    if not output.exists() or output.read_text() != serialized:
        output.write_text(serialized)
    return result
