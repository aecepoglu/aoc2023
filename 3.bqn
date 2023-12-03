num←'0'+↕10
N9 ← {(«𝕎⊢𝕎»)˘(«𝕎⊢𝕎»)𝕩}

Solve←{𝕊raw:
 # extract all the numbers from the map (`values`)
 # also, mark on the map
 #   whether a spot is neighbour to a symbol (`bad`)
 #   which gears a spot is neighbour to (`gid`)
 #   which number a spot belongs to (`mid`)
 # `mid` paired up w/ `gid` gives which 2 numbers belong to a gear
 # `mid` masked over `bad` gives numbers are neighbours to a symbol
 
 Grp←(¬-˜⊢×·+`»⊸>)∘(9⊸≥)

 map←(num∾".")⊐ raw
 # 0-9: digit, 10: space, 11: symbol

 bad ← ∨˙⊸N9 11=map
 val ← ∾Grp⊸⊔¨<˘map
 pos ← ∾((↕∘≠)⋈¨¨¨⊢) (Grp⊔↕∘≠)¨<˘map

 gid ← 0⊸≠⊸/¨ ∾¨˙⊸N9 +`⊸×⌾⥊ '*'=raw

 id  ← (≠¨/1+↕∘≠)pos
 mid ← id⌾((∾pos)⊸⊑) 0¨map

 bid ← ⍷ 0⊸<⊸/ bad(/○⥊)mid

 pair←⍷ (0≠1⊸⊑¨)⊸/∾ gid(⋈¨¨○⥊)mid # ⟨gear_id, part_id⟩ tuples
 pt2 ← +´×´¨ (⊣+10×⊢)´∘⌽¨¨⊏⟜val¨ 1-˜ (2=≠¨)⊸/ ((⊐⊑¨)⊔1⊸⊑¨) pair
 pt1 ← +´ (⊣+10×⊢)´∘⌽ ¨(bid-1)⊏val
 
 pt1‿pt2
}

pt1‿pt2← Solve >•FLines "sample.txt"



