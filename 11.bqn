d←["...#......",
".......#..",
"#.........",
"..........",
"......#...",
".#........",
".........#",
"..........",
".......#..",
"#...#....."]='#'

Solve←{k𝕊d:
 i←((/∘⥊)(⌊∘÷⋈¨|˜)1⊑≢)d # indexes/positions of planets
 s← ⊏⟜k¨(∨´˘⋈∨˝) d # step lengths across rows and cols
 Dist←+´·∾s⊏˜¨(⌊+↕∘|∘-)¨ # steps between positions 𝕨 𝕩
 2÷˜+´⥊ Dist⌜˜i # sum of steps between every pair in i
}

•Show "part 1"⋈2‿1 Solve '#'=>•FLines "input.txt"
•Show "part 2"⋈1_000_000‿1 Solve '#'=>•FLines "input.txt"
