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

    # https://259-momone.hatenablog.com/entry/2022/01/19/021925
    expect technically Number.MAX_VALUE .to.equal '179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368'
    expect technically Number.MIN_VALUE .to.equal '0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004940656458412465441765687928682213723650598026143247644255856825006755072702087518652998363616359923797965646954457177309266567103559397963987747960107818781263007131903114045278458171678489821036887186360569987307230500063874091535649843873124733972731696151400317153853980741262385655911710266585566867681870395603106249319452715914924553293054565444011274801297099995419319894090804165633245247571478690147267801593552386115501348035264934720193790268107107491703332226844753335720832431936092382893458368060106011506169809753078342277318329247904982524730776375927247874656084778203734469699533647017972677717585125660551199131504891101451037862738167250955837389733598993664809941164205702637090279242767544565229087538682506419718265533447265625'

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
