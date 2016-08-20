require! {
  assert
  'big.js'
  'ieee754'
  'left-pad'
}

module.exports = (number) ->
  if typeof! number isnt \Number
    throw new TypeError 'Input value should be number'

  # Special numbers
  if (number |> isNaN) or number in [Infinity, -Infinity]
    return number.to-string!

  # Write the number to buffer with ieee double precision expression
  buffer = [0] * 8
  ieee754.write buffer, number, 0, false, 52, 8

  # Convert to binary bits
  bits = buffer.map (.to-string 2) .map (left-pad _, 8, 0) .join ''

  # Extract information from bits
  sign = if bits.0 |> parse-int then -1 else 1
  exponent = bits.slice 1, 12 |> parse-int _, 2
  mantissa-str = bits.slice 12
  mantissa = parse-int mantissa-str, 2

  # Sanity check
  assert.strict-equal (mantissa.to-string 2 |> left-pad _, 52, 0), mantissa-str

  # Store the original value of big.DP
  original-DP = big.DP
  big.DP = 1e6

  # Handle denormalized numbers and calculate fraction
  if exponent is 0
    fraction = big mantissa
  else
    fraction = big 2 .pow 52 .plus mantissa

  # Calculate exponent
  biased-exponent = big 2 .pow exponent - 1023 - 52

  # Main calculation
  value = fraction.times biased-exponent

  if sign is -1
    signed-value = '-' + value.to-fixed!
  else
    signed-value = value.to-fixed!

  # Restore big.DP
  big.DP = original-DP

  return signed-value
