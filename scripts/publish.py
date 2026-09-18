"""Publish Carter's checked PDF to the owner's library, with a backup."""
import hashlib
import json
from pathlib import Path
import shutil
import stat
import tempfile

from project import ROOT, settings, cache_path


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def publish():
    source = ROOT/settings()['output']
    report = json.loads((cache_path()/'pdf-report.json').read_text())
    expected = report['output_sha256']
    assert digest(source) == expected, 'PDF changed since validation'
    target = (ROOT/json.loads((ROOT/'source.json').read_text())['library_pdf']).resolve()
    if not target.parent.is_dir():
        raise SystemExit('Library is not present at '+str(target.parent))
    old_hash = digest(target) if target.exists() else None
    if old_hash == expected:
        print('Library copy is current: '+str(target))
        return
    mode = stat.S_IMODE(target.stat().st_mode) if target.exists() else 0o644
    if target.exists():
        backup = ROOT.parent/'.archive/carter-1972'/('library-'+old_hash[:12]+'.pdf')
        backup.parent.mkdir(parents=True, exist_ok=True)
        if not backup.exists():
            shutil.copy2(target, backup)
        assert digest(backup) == old_hash, 'Backup verification failed'
    with tempfile.NamedTemporaryFile(prefix='.carter-', suffix='.pdf', dir=target.parent, delete=False) as temp:
        staged = Path(temp.name)
    try:
        shutil.copyfile(source, staged)
        staged.chmod(mode)
        assert digest(staged) == expected
        assert (digest(target) if target.exists() else None) == old_hash, 'Library file changed during publishing'
        staged.replace(target)
    finally:
        staged.unlink(missing_ok=True)
    print('Published '+str(target))
