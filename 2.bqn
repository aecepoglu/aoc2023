color←"red"‿"green"‿"blue"

MSplit←((¬-˜⊢×·+`»⊸>)∘(∧˝≠⌜)⊔⊢)
Num←•BQN
ClrCount←((1⊸⊑(⊑¨0∾˜¨3↑⊔)⊑) ⟨num¨, color⊸⊐⟩ {𝕎𝕩}¨ (2|↕∘≠)⊸⊔)
Parse←{ClrCount¨ 1⊸↓ ", "⊸MSplit¨":;"MSplit 𝕩}

data←Parse¨•FLines "2.txt"

+´1+/(∧´12‿13‿14⊸≥)˘>⌈´¨data # part 1
+´(×´⌈´)¨ data # part 2
