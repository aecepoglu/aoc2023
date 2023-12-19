Num←(⊣+10×⊢)´∘⌽-⟜'0'
MSplit←((¬-˜⊢×·+`»⊸>)∘(¬∘∊˜)⊔⊢)

Parse←{numwin𝕊line: numwin(↑⋈↓) · Num¨ " |"MSplit (∨`·»∘»':'⊸=)⊸/line}
Win←+´ 1⊸⊑∊0⊸⊑ # number of winning cards


# count by hand that there are 10 winning cards in each line
won←(Win 10⊸Parse)¨ •FLines "4.txt"

# part 1
+´2⋆1-˜ 0⊸≠⊸/ won

# part 2
Earn←{d𝕊i‿s: (i⊸<∧≤⟜(i+s)) d} # bitmask over `d` earned by `s` wins at position `i`
idx←↕≠ won
+´ (1¨won){i‿c𝕊ac: ac+(i⊑ac)×idx Earn 𝕨}´⌽ (0⊸≠)⊸(/∘⊣⋈¨/) won
