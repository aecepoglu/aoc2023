# Prime factors
Factor←{acc←⟨⟩ ⋄ 2 {𝕨>𝕩?𝕨;0≠𝕨|𝕩?(𝕨+1)𝕊𝕩; acc∾↩𝕨 ⋄ 𝕨𝕊𝕩÷𝕨} 𝕩 ⋄ acc}
2‿3 (⊣⋈(+´0=⊢|˜⊣⋆1+·↕·⌊⋆⁼))¨ 24

sample_data1←⟨"RL",
              "",
              "AAA = (BBB, CCC)",
              "BBB = (DDD, EEE)",
              "CCC = (ZZZ, GGG)",
              "DDD = (DDD, DDD)",
              "EEE = (EEE, EEE)",
              "GGG = (GGG, GGG)",
              "ZZZ = (ZZZ, ZZZ)"⟩
sample_data2←⟨"LR",
              "",
              "11A = (11B, XXX)",
              "11B = (XXX, 11Z)",
              "11Z = (11B, XXX)",
              "22A = (22B, XXX)",
              "22B = (22C, 22C)",
              "22C = (22Z, 22Z)",
              "22Z = (22B, 22B)",
              "XXX = (XXX, XXX)"⟩

Parse1←{𝕊lines: # returns ⟨movmt, city, init‿goal, leftNright⟩
 fmt←0‿0‿0‿¯1‿¯1‿¯1‿¯1‿1‿1‿1‿¯1‿¯1‿2‿2‿2‿¯1 #  "AAA = (BBB, CCC)"
 triple←fmt⊸⊔¨2↓lines
 id←⊑¨triple
 ("LR"⊐⊑lines)‿id‿(id⊐"AAA"‿"ZZZ")‿(id⊐>1↓¨triple)
}

⟨mov,id,init‿goal,fork⟩ ← Parse1 sample_data1
mov‿id‿left‿right ← Parse1 •FLines "8.txt"

id⊏˜  init{d𝕊c:c‿d⊑fork}˜`mov # view the path
⊑1+/goal=init(⋈˜⊑fork˙)˜` 100000⥊mov # part 1

Parse2←{𝕊lines: # returns ⟨movmt, city, init‿goal, leftNright⟩
 fmt←0‿0‿0‿¯1‿¯1‿¯1‿¯1‿1‿1‿1‿¯1‿¯1‿2‿2‿2‿¯1 #  "AAA = (BBB, CCC)"
 triple←fmt⊸⊔¨2↓lines
 id←⊑¨triple
 ("LR"⊐⊑lines)‿id‿(/¨(0⊸=⋈1⊸=)"AZ"⊐2⊸⊑¨id)‿(id⊐>1↓¨triple)
}
2⊑ ⟨mov,id,init‿goal,fork⟩ ← Parse2 •FLines "8.txt"
2⊑ ⟨mov,id,init‿goal,fork⟩ ← Parse2 sample_data2

step←⊑¨{1+/ goal∊˜𝕩(⋈˜⊑fork˙)˜` 1_000_000⥊mov}¨init

∧´⍷∾ Factor¨step
