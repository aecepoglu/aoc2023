mrr←".|-/"∾(92+@) #. |  -  /  \
n‿e‿s‿w‿z←↕5 # north, east, south, west, dead
u←⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩

# mirror‿direction⊑rf gives outbound ray dirs
rf←(≡◶⋈‿⊢)¨[
 n    ‿e    ‿s    ‿w,     # . 
 n    ‿⟨n,s⟩‿s    ‿⟨n,s⟩, # |
 ⟨w,e⟩‿e    ‿⟨w,e⟩‿w,     # -
 e    ‿n    ‿w    ‿s,     # /
 w    ‿s    ‿e    ‿n,     # \
 ]
# TODO ^ confirm 'rf'
Solve←{loop‿i0‿d0𝕊m:
 Bounce←{𝕊⟨⟩‿⟨⟩:𝕩;𝕊i‿d: ((≠¨/i˙)⋈∾) rf⊑˜(i⊑m)⋈¨d }
 Good←{𝕊i‿·:∧´¨(0‿0⊸≤∧<⟜(≢m))¨i}
 Move←{𝕊i‿d:d⋈˜i+¨d⊏u}
 olds←⟨⟩
 F←{𝕊⟨⟩‿⟨⟩:𝕩;
    𝕊i‿d  :o←olds∊˜i_d←i⋈¨d ⋄ olds∾↩i_d
           (<∘Good/¨⊢) Move Bounce (¬o)⊸/¨𝕩}
 ⟨⟩‿olds⊑˜0=≠⊑ F⍟loop ⋈¨i0‿d0
}

# PART 1
46= +´∊⊑¨⟨100,0‿0,1⟩Solve mrr⊐ >•FLines "sample.txt"
•Show "part 1"⋈+´∊⊑¨answer←⟨1000,0‿0,1⟩ Solve mrr⊐ >•FLines "input.txt"

# PART 2
Part2←{loop𝕊m:
 i←↕≢m
 d←(z⊸≠/¨⊢) (⊑¨)⟜⟨s‿n‿z, e‿w‿z⟩¨ 0‿(1-˜≠m)⊸⊐¨i
 (∨´0⊸=)◶⟨⌈´,"not yet"⟩ {+´∊⊑¨𝕩Solve m}¨ loop⋈⊸∾¨ ∾ i ({𝕨⊸⋈¨𝕩}¨○⥊) d
}

51 = 100 Part2 mrr⊐ >•FLines "sample.txt"
•Show "part 2"⋈1000 Part2 mrr⊐ >•FLines "input.txt"
