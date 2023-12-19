Num←((⊣+10×⊢)´∘⌽'0'-˜⊢)
≠face←"23456789TJQKA"
j←face⊑∘⊐"J"
Parse←(face⊐5⊸↑)⋈(Num 6⊸↓)


id←⌽⟨⟨5⟩ ,1‿4 ,2‿3 ,1‿1‿3 ,1‿2‿2 ,1‿1‿1‿2 ,5⥊1⟩
rule←⌽⟨"Five of a kind","Four of a kind","Full house","Three of a kind","Two pair","One pair", "High card"⟩
Hash←{∧≠¨⊐⊸⊔ 𝕩}
Tell←⍉≍⟜(rule⊏˜id⊐Hash¨)
Score←Hash
Tell "AAAAA"‿"AA8AA"‿"23332"‿"TTT98"‿"23432"‿"A23A4"‿"23456"




dat←Parse¨ •FLines "7.txt"
+´ (1+↕∘≠)⊸× ((id⊐Hash¨)∘(⊑¨) ⍋⊸⊏ 1⊸⊑¨) (⍋⊑¨)⊸⊏ dat # part 1

≠face←"J23456789TQKA"
j←face⊑∘⊐"J"
Parse←(face⊐5⊸↑)⋈(Num 6⊸↓)
Cddt←((<j⊸≠⊸/)∾¨·⥊·⊏⟜(j⊸≠⊸/↕13)¨ 12(↕⥊˜)(+´j⊸=))
Best←{⊑⌈´⊸=⊸/id⊐Hash¨Cddt 𝕩}
"Four of a kind"≡ (Best⊑rule˙) face⊐"QJJQ2"
"Four of a kind"≡ (Best⊑rule˙) face⊐"JKKK2"
"Five of a kind"≡ (Best⊑rule˙) face⊐"JKKKK"

dat←Parse¨ •FLines "7.txt"
+´ (1+↕∘≠)⊸× (Best∘⊑¨ ⍋⊸⊏ 1⊸⊑¨) (⍋⊑¨)⊸⊏ dat # part 2
