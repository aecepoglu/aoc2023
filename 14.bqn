k←"#O."
m←["O....#....",
   "O.OO#....#",
   ".....##...",
   "OO.#O....O",
   ".O.....O#.",
   "O.#..O.#.#",
   "..O..#O..O",
   ".......O..",
   "#....###..",
   "#OO..#...."]⊐˜k

G←1⊑¨·∧(+`0⊸=)⊸(⋈¨) # pull left with gravity
⊏⟜k G k⊐".O.###O..O"

Load←{+´(⌽1+↕≠𝕩)×+´˘ 1=𝕩}
Part1←Load∘(G˘⌾⍉)

136 = Part1 m # example
Part1 k⊐>•FLines "input.txt"

Part2←{n‿warmup𝕊m:
 c←⊐ s←⍉∘⌽∘(G˘⌾⍉) ⍟(4×1+↕warmup) m
 b‿r←⍷ -⟜» /<⟜» c
 s⊑˜ b+r|n-b+1}

(⍉⌽)⍟(↕5)".X"⊏˜0‿3‿4‿5∊˜2‿3⥊↕6

64 = Load (10⋆9)‿100 Part2 m # example
Load (10⋆9)‿100 Part2 m
•Show "part2"⋈Load (10⋆9)‿200 Part2 k⊐>•FLines "input.txt"

