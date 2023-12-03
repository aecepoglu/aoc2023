# part 1 - direct
+´(+´10‿1⊸×)˘'0'-˜>((⊑⋈¯1⊸⊑) (1="0:"⊸⍋)⊸/) ¨ •FLines "1.txt"

# both parts
dstr←⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩
dnum←1+↕9

Ord←(⍋1⊸⊑¨)⊸⊏ # orders numbers by their position
Written←{∾(/⟜dnum⋈⌜¨(/⟜𝕩)) 0<≠¨𝕩} dstr(/⍷)¨ < # finds numbers that are written in text
Exact←{(⊢⋈¨˜'0'-˜⊏⟜𝕩) /∘(1="0:"⊸⍋)𝕩} # finds numbers that are written w/ digits

data←•FLines "1.txt"

# part 1
+´(+´ 10‿1× ⊑⋈¯1⊸⊑)¨(⊑¨Exact)¨data
# part 2
+´(+´ 10‿1× ⊑⋈¯1⊸⊑)∘(⊑¨∘Ord Written∾Exact)¨data
