t←7‿15‿30 # t: time allowed
g←9‿40‿200 # g: goal distance
tbig‿gbig←{•BQN ∾•Fmt¨𝕩}¨t‿g
×´ g(+´<)¨ (-×⊢)⟜↕ ¨t # part 1
71513 = +´ 940200 <(-×⊢)⟜↕ 71530
+´gbig <(-×⊢)⟜↕ tbig
