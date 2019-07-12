This is `bar()`

```act
behaviour bar of Median
interface bar()

for all

  Bar : uint256

storage

  bar |-> Bar

iff

  VCallValue == 0

returns Bar
```

This is `file(uint256)`
```act
behaviour file of Median
interface file(bytes32 what, uint256 data)

for all

  May  : uint256
  Bar  : uint256

storage

  wards[CALLER_ID] |-> May
  bar |-> Bar => (#if what == #string2Word("bar") #then data #else Bar #fi)

iff

  // act: caller is `. ? : not` authorised
  May == 1
  data > 0
  data modInt 2 =/= 0
  VCallValue == 0
```

## if oracle is whitelisted, update val,age
```act
behaviour pork of Median
interface pork(uint256 wad, uint8 v, bytes32 r, bytes32 s)

for all
  Val      : uint128
  Age      : uint128
  IsOracle : uint256
  Signer   : address

storage
  val_age |-> #WordPackUInt128UInt128(Val, Age) => #WordPackUInt128UInt128(wad, TIME)
  orcl[Signer] |-> IsOracle

iff
  VCallValue == 0
  VCallDepth < 1024
  IsOracle == 1
  Signer == #symEcrec(keccakIntList(2661379305446904779734859349833089258949455794555359447896749126450 keccakIntList(wad)), v, r, s)
  #rangeUInt(256, ECREC_BAL)

if
  #rangeUInt(128, wad)
  #rangeUInt(128, TIME)
  
```

```
behaviour pork of Median
interface pork(uint256 wad, uint8 v, bytes32 r, bytes32 s)

for all
  IsOracle : uint256
  Signer   : uint256

storage
  orcl[Signer] |-> IsOracle

iff
  VCallValue == 0
  VCallDepth < 1024
  Signer == #symEcrec(keccakIntList(2661379305446904779734859349833089258949455794555359447896749126450 keccakIntList(wad)), v, r, s)
  IsOracle == 1
  #rangeUInt(256, ECREC_BAL)

returns IsOracle
```


## peek

```act
behaviour peek-eq of Median
interface peek()

for all

    Val : uint128
    Age : uint128
    Bud : uint256

storage

    val_age        |-> #WordPackUInt128UInt128(Val, Age)
    bud[CALLER_ID] |-> Bud

if

    Val > 0

iff

    VCallValue == 0
    Bud == 1

returns Val : 1
```

```act
behaviour peek-neq of Median
interface peek()

for all

    Val : uint128
    Age : uint128
    Bud : uint256

storage

    val_age        |-> #WordPackUInt128UInt128(Val, Age)
    bud[CALLER_ID] |-> Bud

if

    Val == 0

iff

    VCallValue == 0
    Bud == 1

returns Val : 0
```

## read

```act
behaviour read of Median
interface read()

for all

    Val : uint128
    Age : uint128
    Bud : uint256

storage

    bud[CALLER_ID] |-> Bud
    val_age        |-> #WordPackUInt128UInt128(Val, Age)

iff

    VCallValue == 0
    Bud == 1
    Val > 0

returns Val
```

- ecrecover / keccak256
- external vs public
- arrays in calldata
- loops!
