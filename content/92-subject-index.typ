#import "main-defs.typ": index-ref, index-refs, source

= Index <sec:subject-index>

#set text(size: 11pt)
#set par(first-line-indent: 0pt, justify: false, leading: 0.55em)
#let entry(body, sub: false) = block(
  inset: (left: if sub { 1em } else { 0pt }),
  above: 0pt,
  below: 0.35em,
  breakable: false,
)[#set par(hanging-indent: 0.8em)
  #body]

#columns(2, gutter: 7mm)[
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-001",
      original: ((281, 281), (284, 284), (288, 288), (291, 291), (296, 296)),
    ))#source(342, "329")abstract Coxeter complex #h(0.3em) #index-refs(
      281,
      284,
      288,
      291,
      296,
    )]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-002",
      original: ((276, 276),),
    ))adjacent chambers #h(0.3em) #index-refs(276)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-003",
      original: ((198, 198),),
    ))adjoint Chevalley group #h(0.3em) #index-refs(198)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-004",
      original: ((148, 148),),
    ))alternating elements #h(0.3em) #index-refs(148)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-005",
      original: ((139, 139),),
    ))alternating polynomials #h(0.3em) #index-refs(139)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-006",
      original: ((292, 292), (296, 296)),
    ))apartments #h(0.3em) #index-refs(292, 296)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-007",
      original: ((199, 199), (211, 211)),
    ))automorphisms, of Chevalley groups #h(0.3em) #index-refs(199, 211)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-008",
      original: ((60, 60), (63, 63)),
    ))of simple Lie algebras #h(0.3em) #index-refs(60, 63)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-009",
      original: ((128, 128), (129, 129)),
    ))basic polynomial invariants #h(0.3em) #index-refs(128, 129)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-010",
      original: ((169, 169),),
    ))Betti numbers #h(0.3em) #index-refs(169)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-011",
      original: ((107, 114), (294, 294)),
    ))$(B,N)$-pair #h(0.3em) #index-refs((107, 114), 294)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-012",
      original: ((227, 227), (230, 230)),
    ))in twisted groups #h(0.3em) #index-refs(227, 230)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-013",
      original: ((299, 299), (302, 302)),
    ))operating on a building #h(0.3em) #index-refs(299, 302)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-014",
      original: ((104, 104),),
    ))Borel subgroup #h(0.3em) #index-refs(104)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-015",
      original: ((104, 104), (106, 106), (109, 109)),
    ))Bruhat decomposition #h(0.3em) #index-refs(104, 106, 109)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-016",
      original: ((292, 292), (296, 296), (302, 302)),
    ))building #h(0.3em) #index-refs(292, 296, 302)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-017",
      original: ((293, 293), (299, 299)),
    ))associated with a group with $(B,N)$-pair #h(0.3em) #index-refs(293, 299)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-018",
      original: ((115, 115), (117, 117)),
    ))canonical form, for elements of a Chevalley group #h(0.3em) #index-refs(
      115,
      117,
    )]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-019",
      original: ((78, 78),),
    ))for elements of a unipotent subgroup #h(0.3em) #index-refs(78)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-020",
      original: ((229, 229),),
    ))for elements of a twisted group #h(0.3em) #index-refs(229)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-021",
      original: ((35, 35),),
    ))Cartan decomposition #h(0.3em) #index-refs(35)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-022",
      original: ((43, 45), (99, 99), (122, 122)),
    ))Cartan matrix #h(0.3em) #index-refs((43, 45), 99, 122)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-023",
      original: ((78, 78),),
    ))central series of unipotent group #h(0.3em) #index-refs(78)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-024",
      original: ((21, 23), (275, 275)),
    ))chamber #h(0.3em) #index-refs((21, 23), 275)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-025",
      original: ((275, 275),),
    ))chamber complex #h(0.3em) #index-refs(275)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-026",
      original: ((56, 56),),
    ))Chevalley basis #h(0.3em) #index-refs(56)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-027",
      original: ((64, 64),),
    ))Chevalley group, definition #h(0.3em) #index-refs(64)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-028",
      original: ((56, 56),),
    ))Chevalley’s theorems, on existence of integral basis #h(0.3em)
    #index-refs(56)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-029",
      original: ((76, 76),),
    ))on commutator formula #h(0.3em) #index-refs(76)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-030",
      original: ((128, 128),),
    ))on polynomial invariants #h(0.3em) #index-refs(128)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-031",
      original: ((43, 43),),
    ))classification of simple Lie algebras #h(0.3em) #index-refs(43)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-032",
      original: ((114, 114),),
    ))closed set of roots #h(0.3em) #index-refs(114)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-033",
      original: ((166, 166),),
    ))Coleman’s theorem #h(0.3em) #index-refs(166)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-034",
      original: ((76, 76),),
    ))commutator formula #h(0.3em) #index-refs(76)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-035",
      original: ((274, 274),),
    ))complex #h(0.3em) #index-refs(274)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-036",
      original: ((308, 308),),
    ))Conway groups #h(0.3em) #index-refs(308)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-037",
      original: ((49, 49),),
    ))co-roots #h(0.3em) #index-refs(49)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-038",
      original: ((30, 32), (136, 136), (137, 137), (255, 255), (288, 288)),
    ))Coxeter complex #h(0.3em) #index-refs((30, 32), 136, 137, 255, 288)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-039",
      original: ((156, 156),),
    ))Coxeter element #h(0.3em) #index-refs(156)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-040",
      original: ((25, 25), (284, 284), (286, 286), (292, 292)),
    ))Coxeter group #h(0.3em) #index-refs(25, 284, 286, 292)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-041",
      original: ((156, 156),),
    ))Coxeter’s theorem #h(0.3em) #index-refs(156)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-042",
      original: ((130, 133), (145, 145), (155, 155)),
    ))degrees of basic invariants #h(0.3em) #index-refs((130, 133), 145, 155)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-043",
      original: ((34, 34), (61, 61)),
    ))derivations #h(0.3em) #index-refs(34, 61)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-044",
      original: ((200, 200),),
    ))diagonal automorphism #h(0.3em) #index-refs(200)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-045",
      original: ((97, 97), (99, 99), (117, 117)),
    ))diagonal subgroup $H$, of a Chevalley group #h(0.3em) #index-refs(
      97,
      99,
      117,
    )]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-046",
      original: ((238, 238), (244, 244)),
    ))of a twisted group #h(0.3em) #index-refs(238, 244)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-047",
      original: ((158, 158), (161, 161)),
    ))dihedral subgroup of Weyl group #h(0.3em) #index-refs(158, 161)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-048",
      original: ((30, 30), (138, 138)),
    ))distinguished coset representatives #h(0.3em) #index-refs(30, 138)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-049",
      original: ((109, 109), (110, 110)),
    ))double coset decomposition #h(0.3em) #index-refs(109, 110)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-050",
      original: ((156, 156), (168, 168)),
    ))duality of exponents #h(0.3em) #index-refs(156, 168)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-051",
      original: ((49, 49), (50, 50)),
    ))dual root system #h(0.3em) #index-refs(49, 50)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-052",
      original: ((40, 40),),
    ))Dynkin diagram, of a simple Lie algebra #h(0.3em) #index-refs(40)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-053",
      original: ((224, 224),),
    ))of the twisted groups #h(0.3em) #index-refs(224)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-054",
      original: ((165, 165), (166, 166), (168, 168)),
    ))eigenvalues of Coxeter element #h(0.3em) #index-refs(165, 166, 168)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-055",
      original: ((124, 124),),
    ))elementary symmetric polynomials #h(0.3em) #index-refs(124)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-056",
      original: ((42, 42),),
    ))existence theorem for simple Lie algebras #h(0.3em) #index-refs(42)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-057",
      original: ((60, 60), (66, 66)),
    ))exponential map #h(0.3em) #index-refs(60, 66)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-058",
      original: ((169, 169),),
    ))#source(343, "330")exponents of Weyl group #h(0.3em) #index-refs(169)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-059",
      original: ((58, 58),),
    ))extraspecial pair of roots #h(0.3em) #index-refs(58)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-060",
      original: ((135, 135),),
    ))factorization of the polynomial $sum t^(l(w))$, in Chevalley groups #h(
      0.3em,
    ) #index-refs(135)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-061",
      original: ((254, 254),),
    ))in twisted groups #h(0.3em) #index-refs(254)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-062",
      original: ((200, 200),),
    ))field automorphism #h(0.3em) #index-refs(200)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-063",
      original: ((120, 122),),
    ))finite Chevalley groups #h(0.3em) #index-refs((120, 122))]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-064",
      original: ((251, 251),),
    ))finite twisted groups #h(0.3em) #index-refs(251)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-065",
      original: ((309, 309),),
    ))Fischer groups #h(0.3em) #index-refs(309)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-066",
      original: ((277, 277),),
    ))folding #h(0.3em) #index-refs(277)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-067",
      original: ((162, 162),),
    ))Frobenius–Perron theorem #h(0.3em) #index-refs(162)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-068",
      original: ((99, 99),),
    ))fundamental group #h(0.3em) #index-refs(99)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-069",
      original: ((17, 17),),
    ))fundamental reflection #h(0.3em) #index-refs(17)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-070",
      original: ((13, 13), (19, 19), (21, 21)),
    ))fundamental system of roots #h(0.3em) #index-refs(13, 19, 21)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-071",
      original: ((98, 98), (146, 146), (148, 148)),
    ))fundamental weights #h(0.3em) #index-refs(98, 146, 148)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-072",
      original: ((276, 276),),
    ))gallery #h(0.3em) #index-refs(276)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-073",
      original: ((190, 190),),
    ))generators and relations, for Chevalley group #h(0.3em) #index-refs(190)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-074",
      original: ((23, 23), (25, 25)),
    ))for Weyl group #h(0.3em) #index-refs(23, 25)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-075",
      original: ((204, 204),),
    ))graph automorphism, of the groups $B_2(K),F_4(K)$ #h(0.3em) #index-refs(
      204,
    )]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-076",
      original: ((206, 206),),
    ))of the group $G_2(K)$ #h(0.3em) #index-refs(206)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-077",
      original: ((16, 16), (77, 77), (153, 155)),
    ))height of a root #h(0.3em) #index-refs(16, 77, (153, 155))]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-078",
      original: ((306, 306),),
    ))Held group #h(0.3em) #index-refs(306)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-079",
      original: ((307, 307),),
    ))Higman–Sims group #h(0.3em) #index-refs(307)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-080",
      original: ((87, 87),),
    ))homomorphism, from $S L_2(CC)$ #h(0.3em) #index-refs(87)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-081",
      original: ((88, 88),),
    ))from $S L_2(K)$ #h(0.3em) #index-refs(88)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-082",
      original: ((33, 33),),
    ))ideal of Lie algebra #h(0.3em) #index-refs(33)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-083",
      original: ((136, 136),),
    ))induced character #h(0.3em) #index-refs(136)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-084",
      original: ((42, 42),),
    ))isomorphism theorem for simple Lie algebras #h(0.3em) #index-refs(42)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-085",
      original: ((134, 134), (166, 166)),
    ))Jacobian #h(0.3em) #index-refs(134, 166)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-086",
      original: ((33, 33),),
    ))Jacobi identity #h(0.3em) #index-refs(33)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-087",
      original: ((305, 305),),
    ))Janko groups #h(0.3em) #index-refs(305)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-088",
      original: ((97, 97), (99, 99), (121, 121), (199, 199)),
    ))$K$-character #h(0.3em) #index-refs(97, 99, 121, 199)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-089",
      original: ((238, 238),),
    ))self-conjugate #h(0.3em) #index-refs(238)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-090",
      original: ((34, 34),),
    ))Killing form #h(0.3em) #index-refs(34)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-091",
      original: ((308, 308),),
    ))Leech lattice #h(0.3em) #index-refs(308)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-092",
      original: ((169, 169),),
    ))Lefschetz fixed point formula #h(0.3em) #index-refs(169)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-093",
      original: ((18, 18), (136, 136)),
    ))length function #h(0.3em) #index-refs(18, 136)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-094",
      original: ((118, 118),),
    ))Levi decomposition #h(0.3em) #index-refs(118)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-095",
      original: ((119, 119),),
    ))Levi subgroup #h(0.3em) #index-refs(119)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-096",
      original: ((33, 33),),
    ))Lie algebra, definition #h(0.3em) #index-refs(33)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-097",
      original: ((2, 2), (184, 184), (185, 185)),
    ))linear groups #h(0.3em) #index-refs(2, 184, 185)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-098",
      original: ((306, 306),),
    ))Lyons group #h(0.3em) #index-refs(306)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-099",
      original: ((151, 151),),
    ))Macdonald’s theorem #h(0.3em) #index-refs(151)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-100",
      original: ((303, 303),),
    ))Mathieu groups #h(0.3em) #index-refs(303)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-101",
      original: ((286, 286),),
    ))Matsumoto’s theorem #h(0.3em) #index-refs(286)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-102",
      original: ((307, 307),),
    ))McLaughlin group #h(0.3em) #index-refs(307)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-103",
      original: ((101, 101),),
    ))monomial subgroup $N$, of Chevalley group #h(0.3em) #index-refs(101)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-104",
      original: ((228, 228),),
    ))of twisted group #h(0.3em) #index-refs(228)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-105",
      original: ((102, 102),),
    ))relationship to Weyl group #h(0.3em) #index-refs(102)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-106",
      original: ((276, 276),),
    ))morphism of chamber complexes #h(0.3em) #index-refs(276)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-107",
      original: ((61, 61), (66, 66), (69, 69)),
    ))nilpotent derivations #h(0.3em) #index-refs(61, 66, 69)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-108",
      original: ((35, 35),),
    ))nilpotent Lie algebra #h(0.3em) #index-refs(35)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-109",
      original: ((280, 280),),
    ))opposite folding #h(0.3em) #index-refs(280)]
  #block(breakable: false, below: 0.45em)[
    #entry[#metadata((
        kind: "index-entry",
        id: "subject-110",
        original: ((163, 163), (168, 168)),
      ))order, of Coxeter elements #h(0.3em) #index-refs(163, 168)]
    #entry(sub: true)[#metadata((
        kind: "index-entry",
        id: "subject-111",
        original: ((122, 122), (144, 144)),
      ))of finite Chevalley groups #h(0.3em) #index-refs(122, 144)]
    #entry(sub: true)[#metadata((
        kind: "index-entry",
        id: "subject-112",
        original: ((253, 253), (259, 259), (262, 262)),
      ))of finite twisted groups #h(0.3em) #index-refs(253, 259, 262)]
    #entry(sub: true)[#metadata((
        kind: "index-entry",
        id: "subject-113",
        original: ((310, 310),),
      ))of sporadic simple groups #h(0.3em) #index-refs(310)]
  ]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-114",
      original: ((13, 13),),
    ))ordering of vector space #h(0.3em) #index-refs(13)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-115",
      original: ((4, 8), (184, 188), (271, 271)),
    ))orthogonal groups #h(0.3em) #index-refs((4, 8), (184, 188), 271)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-116",
      original: ((111, 113),),
    ))parabolic subgroups, of a group with $(B,N)$-pair #h(0.3em) #index-refs((
      111,
      113,
    ))]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-117",
      original: ((118, 118), (119, 119)),
    ))of a Chevalley group #h(0.3em) #index-refs(118, 119)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-118",
      original: ((231, 231),),
    ))of a twisted group #h(0.3em) #index-refs(231)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-119",
      original: ((27, 30), (32, 32)),
    ))of a Weyl group #h(0.3em) #index-refs((27, 30), 32)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-120",
      original: ((169, 169),),
    ))Poincaré polynomial #h(0.3em) #index-refs(169)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-121",
      original: ((123, 123),),
    ))polynomial invariants of Weyl group #h(0.3em) #index-refs(123)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-122",
      original: ((13, 13),),
    ))positive systems of roots #h(0.3em) #index-refs(13)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-123",
      original: ((35, 35),),
    ))rank of a Lie algebra #h(0.3em) #index-refs(35)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-124",
      original: ((251, 251),),
    ))Ree groups #h(0.3em) #index-refs(251)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-125",
      original: ((184, 184),),
    ))Ree’s theorem #h(0.3em) #index-refs(184)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-126",
      original: ((12, 12), (284, 284)),
    ))reflections #h(0.3em) #index-refs(12, 284)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-127",
      original: ((282, 282), (296, 296)),
    ))retractions #h(0.3em) #index-refs(282, 296)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-128",
      original: ((36, 36),),
    ))roots of a simple Lie algebra #h(0.3em) #index-refs(36)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-129",
      original: ((68, 68),),
    ))root subgroups, of Chevalley groups #h(0.3em) #index-refs(68)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-130",
      original: ((233, 233), (235, 235)),
    ))of twisted groups #h(0.3em) #index-refs(233, 235)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-131",
      original: ((12, 12), (45, 49)),
    ))root systems #h(0.3em) #index-refs(12, (45, 49))]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-132",
      original: ((36, 36),),
    ))#source(344, "331")semi-simple Lie algebra #h(0.3em) #index-refs(36)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-133",
      original: ((274, 274),),
    ))simplex #h(0.3em) #index-refs(274)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-134",
      original: ((172, 172),),
    ))simplicity, of Chevalley groups #h(0.3em) #index-refs(172)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-135",
      original: ((170, 170),),
    ))of groups with $(B,N)$-pair #h(0.3em) #index-refs(170)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-136",
      original: ((262, 262),),
    ))of twisted groups #h(0.3em) #index-refs(262)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-137",
      original: ((67, 67), (81, 81), (87, 87), (88, 88)),
    ))$S L_2$ #h(0.3em) #index-refs(67, 81, 87, 88)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-138",
      original: ((135, 135), (143, 143)),
    ))Solomon’s theorem #h(0.3em) #index-refs(135, 143)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-139",
      original: ((58, 58),),
    ))special pair of roots #h(0.3em) #index-refs(58)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-140",
      original: ((303, 303),),
    ))sporadic simple groups #h(0.3em) #index-refs(303)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-141",
      original: ((211, 211),),
    ))Steinberg’s theorems, on automorphisms of finite Chevalley groups #h(
      0.3em,
    ) #index-refs(211)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-142",
      original: ((190, 190),),
    ))on generators and relations for Chevalley groups #h(0.3em) #index-refs(
      190,
    )]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-143",
      original: ((23, 23), (25, 25)),
    ))on generators and relations for the Weyl group #h(0.3em) #index-refs(
      23,
      25,
    )]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-144",
      original: ((303, 303),),
    ))Steiner system #h(0.3em) #index-refs(303)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-145",
      original: ((52, 52), (55, 55), (58, 58)),
    ))structure constants #h(0.3em) #index-refs(52, 55, 58)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-146",
      original: ((211, 211),),
    ))for the Lie algebra $G_2$ #h(0.3em) #index-refs(211)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-147",
      original: ((33, 33),),
    ))subalgebras of Lie algebras #h(0.3em) #index-refs(33)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-148",
      original: ((251, 251), (307, 307)),
    ))Suzuki groups #h(0.3em) #index-refs(251, 307)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-149",
      original: ((123, 123),),
    ))symmetric algebra #h(0.3em) #index-refs(123)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-150",
      original: ((124, 124),),
    ))symmetric group #h(0.3em) #index-refs(124)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-151",
      original: ((124, 124),),
    ))symmetric polynomials #h(0.3em) #index-refs(124)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-152",
      original: ((200, 200), (221, 223)),
    ))symmetry of Dynkin diagram #h(0.3em) #index-refs(200, (221, 223))]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-153",
      original: ((3, 3), (184, 184), (186, 186)),
    ))symplectic groups #h(0.3em) #index-refs(3, 184, 186)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-154",
      original: ((302, 302),),
    ))Tits’ theorems, on finite groups with $(B,N)$-pair #h(0.3em) #index-refs(
      302,
    )]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-155",
      original: ((112, 112), (113, 113)),
    ))on parabolic subgroups #h(0.3em) #index-refs(112, 113)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-156",
      original: ((170, 170),),
    ))on simplicity of groups with $(B,N)$-pair #h(0.3em) #index-refs(170)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-157",
      original: ((296, 296),),
    ))on the apartments of a building #h(0.3em) #index-refs(296)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-158",
      original: ((304, 304), (306, 306)),
    ))transitive extensions #h(0.3em) #index-refs(304, 306)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-159",
      original: ((226, 226),),
    ))twisted group, definition #h(0.3em) #index-refs(226)]
  // Balance the final page at a complete main entry.
  #colbreak()
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-160",
      original: ((298, 298),),
    ))type, of element in a building #h(0.3em) #index-refs(298)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-161",
      original: ((283, 283),),
    ))of element in a chamber complex #h(0.3em) #index-refs(283)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-162",
      original: ((284, 284), (290, 290), (291, 291), (299, 299)),
    ))type-preserving automorphisms #h(0.3em) #index-refs(284, 290, 291, 299)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-163",
      original: ((68, 68),),
    ))unipotent linear transformation #h(0.3em) #index-refs(68)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-164",
      original: ((68, 68), (78, 78), (104, 104), (114, 114)),
    ))unipotent subgroup, of a Chevalley group #h(0.3em) #index-refs(
      68,
      78,
      104,
      114,
    )]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-165",
      original: ((231, 231),),
    ))of a twisted group #h(0.3em) #index-refs(231)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-166",
      original: ((197, 197),),
    ))universal Chevalley group #h(0.3em) #index-refs(197)]
  #v(0.65em, weak: true)
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-167",
      original: ((149, 149),),
    ))Weyl’s theorem #h(0.3em) #index-refs(149)]
  #entry[#metadata((
      kind: "index-entry",
      id: "subject-168",
      original: ((13, 13),),
    ))Weyl group, of a root system #h(0.3em) #index-refs(13)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-169",
      original: ((102, 102),),
    ))of a Chevalley group #h(0.3em) #index-refs(102)]
  #entry(sub: true)[#metadata((
      kind: "index-entry",
      id: "subject-170",
      original: ((221, 224), (226, 226), (228, 228)),
    ))of a twisted group #h(0.3em) #index-refs((221, 224), 226, 228)]
]
