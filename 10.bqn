Pad←{𝕨(∾∾⊣)˘(𝕨¨⊏)⊸(∾∾⊣)𝕩}
d←↕4 # N E S W
u←⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩
p1←"nesw"⊐["    ", # .
           "e  s", # F
           "ws  ", # 7
           " nw ", # J
           "  en", # L
           "n s ", # |
           " e w"] # -
p2←[ 0‿0‿0‿0   # ‿
   , 0‿1‿1‿0   # ┌
   , 0‿0‿1‿1   # ┐
   , 1‿0‿0‿1   # ┘
   , 1‿1‿0‿0   # └
   , 1‿0‿1‿0   # │
   , 0‿1‿0‿1 ] # ─
NoS←{𝕊data:
 m←".F7JL|-S"⊐ data
   #01234567
 m⊏" ┌┐┘└│─S"
 i_s←⊑(/∘⥊(⌊∘÷⋈¨|˜)≠∘⊏)7=m
 (m⊑˜i_s⊸+¨u)⊏˘(⍉4>p1) # which ways i_s can go
 i0‿d0←⊑¨ ·‿d0s←{(/⟜𝕩⋈/)(⍉4>p1)⊏˘˜𝕩⊑m}i_s⊸+¨u
       # replace 'S' with the shape
 i_s ⋈ (⊑/(∧´d0s⊸∊)˘p1)⌾(i_s⊸⊑) m
}

Travel←{i_s𝕊m:
 'X'⌾(i_s⊸⊑) ⊏⟜" ┌┐┘└│─S" m
 d0s←/(i_s⊑m)⊏p2
 i0‿d0←⊑d0s⋈¨˜i_s⊸+¨d0s⊏u
 # i: my position
 # d: my direction (where I've entered pos i from)
 F←{𝕊i‿d:(i+⊑⟜u)⊸⋈ p1⊑˜ d⋈˜i⊑m}
 F⍟(↕×´≢m) i0‿d0 # part 1
} 
Solve←{𝕊data:
 i‿m←NoS data
 2÷˜1⊑/ ∊⟜(1⊸↑) i Travel m
}

4 = Solve [".....",".S-7.",".|.|.",".L-J.","....."]
8 = Solve data←["..F7.", ".FJ|.", "SJ.L7", "|F--J", "LJ..."]
# Part 1
•Show "part1"⋈ Solve >•FLines "input.txt"

right‿down←∨´¨¨(1⊸=⋈2⊸=)/¨(∧⟜(2⊸⌽)○(⊏⟜p2))⌜˜↕7
Widen←{k‿a𝕊𝕩:((·⥊2⊸↑˘)∾¯1‿¯1⊸⊑) (⊑(⊣∾(k×⋈⊑a˙)∾⊢)1⊸⊑)˘2↕𝕩}
Shrink←(0=2|↕∘≠)⊸/
Unpad←1↓ ¯1↓ (¯1↓1↓⊢)˘
Grw←{2𝕊1:1; 2𝕊·:2; 𝕩}
# ⊏⟜" ┌┐┘└│─S" m
# ⊏⟜" ┌┐┘└│─S" Widen˘m
# m≡Shrink∘Widen˘m
Solve2←{𝕊data:
 i0‿m0←NoS data
 mc←m0 ×(⍷⊑¨i0 Travel m0) ∊˜ ↕≢m0
 ⊏⟜" ┌┐┘└│─S" m←0 Pad 5‿down⊸Widen˘⌾(⌽⍉) 6‿right⊸Widen˘mc
 ⊏⟜".#/" fin←Shrink˘⌾⍉ Shrink˘Unpad finb←(⌽∘⍉Grw`˘)⍟200 2⌾(0‿0⊸⊑) 0≠m
 # ⊏⟜" ┌┐┘└│─S#" m0+8×0= Shrink˘⌾⍉ Shrink˘Unpad finb
 # •Out˘⊏⟜" ┌┐┘└│─S#" (Shrink˘⌾⍉ Shrink˘Unpad m)+8×0=fin
 +´0=⥊fin
}

Solve2v2←{𝕊data:
 i0‿m0←NoS data
 mc←m0 ×(⍷⊑¨i0 Travel m0) ∊˜ ↕≢m0
 snap←⍷ i0 Travel mc
 duvd←(1⊸⊑¨snap)⌾((⊑¨snap)⊸⊑) 5¨mc
 +´⥊(0=mc)∧2=({𝕨𝕊5:𝕨;𝕩}`⌾⌽)˘duvd
}
smpl←["...........",
      ".S-------7.",
      ".|F-----7|.",
      ".||.F.L.||.",
      ".||.....||.",
      ".|L--7F-J|.",
      ".|.|.||..|.",
      ".L---JL--J.",
      "..........."]

5=Solve2 smpl
5=Solve2v2 smpl
•Show "part2" ⋈ Solve2   >•FLines "input.txt"
•Show "part2" ⋈ Solve2v2 >•FLines "input.txt"

