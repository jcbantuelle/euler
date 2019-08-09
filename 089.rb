require 'pp'

roman_numerals = []
file = IO.readlines('roman.txt')
file.each do |roman_numeral|
  roman_numerals << roman_numeral.strip
end

$numerals = {
  'M' => 1000,
  'D' => 500,
  'C' => 100,
  'L' => 50,
  'X' => 10,
  'V' => 5,
  'I' => 1
}

$choices = [
  {
    value: 1000,
    numeral: 'M',
    subtractive: false
  },
  {
    value: 900,
    numeral: 'CM',
    subtractive: true,
    replacement: 'DCCCC'
  },
  {
    value: 500,
    numeral: 'D',
    subtractive: false
  },
  {
    value: 400,
    numeral: 'CD',
    subtractive: true,
    replacement: 'CCCC'
  },
  {
    value: 100,
    numeral: 'C',
    subtractive: false
  },
  {
    value: 90,
    numeral: 'XC',
    subtractive: true,
    replacement: 'LXXXX'
  },
  {
    value: 50,
    numeral: 'L',
    subtractive: false
  },
  {
    value: 40,
    numeral: 'XL',
    subtractive: true,
    replacement: 'XXXX'
  },
  {
    value: 10,
    numeral: 'X',
    subtractive: false
  },
  {
    value: 9,
    numeral: 'IX',
    subtractive: true,
    replacement: 'VIIII'
  },
  {
    value: 5,
    numeral: 'V',
    subtractive: false
  },
  {
    value: 4,
    numeral: 'IV',
    subtractive: true,
    replacement: 'IIII'
  },
  {
    value: 1,
    numeral: 'I',
    subtractive: false
  }
]

$subtractives = $choices.select{|c| c[:subtractive]}

def build_roman_numeral(decimal_representation)
  roman_numeral = ''
  while decimal_representation > 0 do
    next_numeral = $choices.find{|i| i[:value] <= decimal_representation}
    decimal_representation -= next_numeral[:value]
    roman_numeral += next_numeral[:numeral]
  end
  roman_numeral
end

def interpret_roman_numeral(roman_numeral)
  roman_numeral = roman_numeral.dup
  $subtractives.each do |s|
    roman_numeral.gsub!(s[:numeral], s[:replacement])
  end
  roman_numeral.chars.reduce(0) { |sum, letter|
    sum + $numerals[letter]
  }
end

pp roman_numerals.inject(0) { |total, original_numeral|
  decimal_representation = interpret_roman_numeral(original_numeral)
  optimal_numeral = build_roman_numeral(decimal_representation)
  diff = original_numeral.length - optimal_numeral.length
  total + diff
}