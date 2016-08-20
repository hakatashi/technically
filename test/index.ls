require! {
  '../': exact
  chai: {expect}
  'big.js'
}

It = global.it

describe 'API' ->
  It 'converts Number to String' ->
    expect typeof exact 100 .to.equal 'string'

  It 'throw error when non-Numbers are given' ->
    expect -> exact 'foo'
    .to.throw TypeError

    expect -> exact /foo/
    .to.throw TypeError

    expect -> exact [1 2 3]
    .to.throw TypeError

    expect -> exact new Promise ->
    .to.throw TypeError

describe 'Conversion' ->
  It 'converts number to string' ->
    expect exact 42 .to.equal '42'
    expect exact 52149 .to.equal '52149'
    # Number.MAX_SAFE_INTEGER
    expect exact 9007199254740991 .to.equal '9007199254740991'
    expect exact 1e20 .to.equal '100000000000000000000'

  It 'supports stringification with the infinite length of precision' ->
    expect exact 1e21 .to.equal '1000000000000000000000'

    expect exact Number.MAX_VALUE .to.have.length-of 309
    expect exact Number.MAX_VALUE .to.equal big(2).pow(1024).to-fixed!

  It 'supports basic decimal fractions with actual precision' ->
    expect exact 0.125 .to.equal '0.125'

  It 'supports some odd decimal fractions with approximation' ->
    # Bought from https://docs.python.org/3/tutorial/floatingpoint.html
    expect exact 0.1 .to.equal '0.1000000000000000055511151231257827021181583404541015625'

  It 'supports minus zero' ->
    expect exact -0 .to.equal '-0'

  It 'supports NaN' ->
    expect exact NaN .to.equal 'NaN'

  It 'supports both Infinities' ->
    expect exact Infinity .to.equal 'Infinity'
    expect exact -Infinity .to.equal '-Infinity'
