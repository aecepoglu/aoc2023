# Get all the (horizontal) splits of  
Cut←(1↓↕∘≠)⊸((⌽∘↑⋈↓)¨)⟜<
Sym←(≡´(⌊´≠¨)⊸(↑¨))
NearSym←(1=·+´·⥊ ·≠´(⌊´≠¨)⊸(↑¨))

≠raw←•FLines "input.txt"
≠ms←'#'=>¨((⊢-˜¬×+`)∘(0=≠¨)⊔⊢)raw
+´∾100‿1⊸×¨{(⊑1↑1+·/Sym¨∘Cut)¨⋈⟜⍉𝕩}¨ ms # part 1
+´∾100‿1⊸×¨{(⊑1↑1+·/NearSym¨∘Cut)¨⋈⟜⍉𝕩}¨ ms # part 2
