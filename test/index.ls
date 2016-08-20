require! {
  '../': technically
  chai: {expect}
  'big.js'
}

It = global.it

describe 'API' ->
  It 'converts Number to String' ->
    expect typeof technically 100 .to.equal 'string'

  It 'throw error when non-Numbers are given' ->
    expect -> technically 'foo'
    .to.throw TypeError

    expect -> technically /foo/
    .to.throw TypeError

    expect -> technically [1 2 3]
    .to.throw TypeError

    expect -> technically new Date!
    .to.throw TypeError

  It 'restores original big.DP value after conversion' ->
    big.DP = 334
    technically 334

    expect big.DP .to.equal 334

describe 'Conversion' ->
  It 'converts number to string' ->
    expect technically 42 .to.equal '42'
    expect technically 52149 .to.equal '52149'
    # Number.MAX_SAFE_INTEGER
    expect technically 9007199254740991 .to.equal '9007199254740991'
    expect technically 1e20 .to.equal '100000000000000000000'

  It 'supports stringification with the infinite length of precision' ->
    expect technically 1e21 .to.equal '1000000000000000000000'

    expect technically Number.MAX_VALUE .to.have.length-of 309
    expect technically Number.MAX_VALUE .to.equal big(2).pow(1024).minus(big(2).pow(971)).to-fixed!

  It 'supports basic decimal fractions with actual precision' ->
    expect technically 0.125 .to.equal '0.125'

  It 'supports some odd decimal fractions with approximation' ->
    # Bought from https://docs.python.org/3/tutorial/floatingpoint.html
    expect technically 0.1 .to.equal '0.1000000000000000055511151231257827021181583404541015625'

  It 'supports denormalized values' ->
    big.DP = 1e6
    expected = big 2 .pow -1074 .to-fixed!

    expect technically Number.MIN_VALUE .to.equal expected

  It 'supports minus zero' ->
    expect technically -0 .to.equal '-0'

  It 'supports NaN' ->
    expect technically NaN .to.equal 'NaN'

  It 'supports both Infinities' ->
    expect technically Infinity .to.equal 'Infinity'
    expect technically -Infinity .to.equal '-Infinity'
