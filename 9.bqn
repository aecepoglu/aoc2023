sample←⟨⟨0, 3, 6, 9, 12, 15⟩, ⟨1, 3, 6, 10, 15, 21⟩, ⟨10, 13, 16, 21, 30, 45⟩⟩

Valf←{⟨⟩ (+´ ¯1⊸⊑∾{∨´0≠𝕩? 𝕨((⊣∾¯1⊸⊑)𝕊⊢)1↓-⟜»𝕩; 𝕨}) 𝕩}
Val←{i𝕊line: ⟨⟩ ( i⊸⊑∾{∨´0≠𝕩? 𝕨((⊣∾i⊸⊑)𝕊⊢)1↓-⟜»𝕩; 𝕨}) line}
Num←('-'=⊑)⊸{(𝕨⊑1‿¯1)×(⊣+10×⊢)´∘⌽ '0'-˜𝕨↓𝕩}
Parse←Num¨' '⊸((⊢-˜¬×+`)∘=⊔⊢)

114 = +´¯1⊸Val¨sample # test
114 =
0⊸Val⊑ sample # test

2   = +´(+´¯1⊸Val) ¨sample # part 1
114 = +´(-´0⊸Val) ¨sample # part 2
+´(+´¯1⊸Val) ¨Parse¨•FLines "9.txt" # part 1
+´(-´0⊸Val) ¨Parse¨•FLines "9.txt" # part 2
