s-@#* Determine the ASCII code for the current character of the string.
#* Increase the current value by the ASCII code you just determined.
#* Set the current value to itself multiplied by 17.
#* Set the current value to the remainder of dividing itself by 256.
52 = 0(256|17×+)´⌽@-˜"HASH"
H← ⊣(256|17×+)´·⌽@-˜⊢
H0←0⊸H
52 = H0 "HASH"
Part1←{+´ H0¨ ','((⊢-˜¬×+`)∘=⊔⊢) 𝕩}
1320 Part1 "rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7"
Part1 ⊑•FLines"input.txt"

# finds the last `a` value for each `n`
#  o=0 is a put : sets value of 'n' to 'a'
#  o=1 is a delete : deletes 'n'
Last←{𝕊a‿n‿o:i←⊏⟜(⊔⊑¨˜·(⊑1⊸↑)∘/∘(¬∨`⌾⌽)¨⊔⟜o)⊐n
             ((⍋1⊸⊑)⊏⊑) ((∊⌾⌽n)∧(0=o))⊸/¨a⋈1+i}
Part2←{𝕊log:
 book←(+`∨⟜»)∘(∊⟜"=-")⊸⊔¨','((⊢-˜¬×+`)∘=⊔⊢) log
 i←H0∘⊑¨book ⋄ name←⊐⊑¨book ⋄ op←3‿2⊐≠¨book
 arg←(≠◶⟨0,⊑∘⊑⟩)¨'0'-˜2↓¨book
 +´×⟜(1+↕∘≠) (+´×⟜(1+↕∘≠))∘Last˘⍉> i⊸⊔¨arg‿name‿op
}

Part2 ⊑•FLines"input.txt"
