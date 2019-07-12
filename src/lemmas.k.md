### macros

```k
syntax Int ::= "pow128"  [function]
rule pow128 => 340282366920938463463374607431768211456                [macro]

syntax Int ::= "#string2Word" "(" String ")" [function]
// ----------------------------------------------------
rule #string2Word(S) => #asWord(#padRightToWidth(32, #parseByteStackRaw(S)))

//assume ecrec returns an address
rule maxUInt160 &Int #symEcrec(MSG, V, R, S) => #symEcrec(MSG, V, R, S)

//assume ecrec returns an address
rule #symEcrec(MSG, V, R, S) &Int maxUInt160 => #symEcrec(MSG, V, R, S)
```
