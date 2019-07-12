```k
syntax Int ::= "#WordPackUInt128UInt128" "(" Int "," Int ")"  [function]
rule #WordPackUInt128UInt128(X, Y) => Y *Int pow128 +Int X
  requires #rangeUInt(128, X)
  andBool  #rangeUInt(128, Y)

syntax Int ::= "MaskFirst16"                                           [function]
rule MaskFirst16 => 340282366920938463463374607431768211455            [macro]

rule MaskFirst16 &Int (Y *Int pow128 +Int X) => X
  requires #rangeUInt(128, Y)
  andBool #rangeUInt(128, X)

syntax Int ::= "#Median.wards" "[" Int "]"   [function]
rule #Median.wards[A] => #hashedLocation("Solidity", 0, A)

syntax Int ::= "#Median.val_age" [function]
rule #Median.val_age => 1

syntax Int ::= "#Median.bar" [function]
rule #Median.bar => 2

syntax Int ::= "#Median.orcl" "[" Int "]"   [function]
rule #Median.orcl[A] => #hashedLocation("Solidity", 3, A)

syntax Int ::= "#Median.bud" "[" Int "]"   [function]
rule #Median.bud[A] => #hashedLocation("Solidity", 4, A)
```