Num←(⊣+10×⊢)´∘⌽-⟜'0'
Parse←{(⊑∘⊑∘⊑⋈1⊸⊑) (Num¨' '⊸=(⊢-˜¬×+`)⊸⊔⊢)¨¨¨((⋈∘⋈"seeds: "≠⊸↓⊑)∘⊑⋈(1⊸↓¨)∘(1⊸↓))  ((¬-˜⊢×·+`»⊸>)∘(0≠≠¨)⊔⊢) 𝕩}

Foo←{map𝕊n:
 dst‿src‿span←∾¨´ map
 n≍ i← (2⊸| × 2÷˜1⊸+) n ⍋˜ src(∾ ⊣∾¨+)span
 n + dst -○(i⊏0⊸∾) src
}
Brk←{map𝕊ran:
 src←⍷ (1⊸⊑¨map) (∾ ⊣∾¨+) (2⊸⊑¨map)
 ran (∾{c𝕊a‿b:(a⊸<∧<⟜b)c?⟨a‿c,c‿b⟩
                        ;⋈𝕩       }¨)´ src
}
Pair←(⌊2÷˜↕∘≠)⊸⊔
Merge←{(≠⟜«⊑¨)⊸/ {a‿b𝕊c‿d:b≥c?a⋈b⌈d;𝕩}` (⍋⊑¨)⊸⊏ 𝕩}


num0‿maps←Parse •FLines "sample.txt"
maps←(⍋1⊸⊑¨)⊸⊏¨maps
⌊´ num0 Foo´ ⌽maps # part 1

(2⊑maps) Brk (1⊑maps) (⊣ (Merge∘(∧¨)∘Pair Foo⟜∾) Brk) (⊑maps) (⊣ (Merge∘(∧¨)∘Pair Foo⟜∾) Brk) (»⊸+¨Pair num0)

(0‿¯1⊸+¨»⊸+¨Pair num0) (⊣ ((∧¨)∘Pair Foo⟜∾) Brk)´ ⌽(maps) # part 2
