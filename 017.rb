num_words = {}
num_words[1] = "one"
num_words[2] = "two"
num_words[3] = "three"
num_words[4] = "four"
num_words[5] = "five"
num_words[6] = "six"
num_words[7] = "seven"
num_words[8] = "eight"
num_words[9] = "nine"
num_words[10] = "ten"
num_words[11] = "eleven"
num_words[12] = "twelve"
num_words[13] = "thirteen"
num_words[14] = "fourteen"
num_words[15] = "fifteen"
num_words[16] = "sixteen"
num_words[17] = "seventeen"
num_words[18] = "eighteen"
num_words[19] = "nineteen"
num_words[20] = "twenty"
num_words[30] = "thirty"
num_words[40] = "forty"
num_words[50] = "fifty"
num_words[60] = "sixty"
num_words[70] = "seventy"
num_words[80] = "eighty"
num_words[90] = "ninety"
num_words[100] = "hundred"

sum = 0
(1..999).each { |i|
  word = ""
  hundreds_divisor = i / 100
  hundreds_modulo = i % 100
  if hundreds_divisor >= 1
    word += num_words[hundreds_divisor] + num_words[100]
    word += "and" if hundreds_modulo != 0
  end 
  if hundreds_modulo != 0
    if num_words[hundreds_modulo].nil?
      tens_modulo = hundreds_modulo % 10
      tens_divisor = hundreds_modulo - tens_modulo
      word += num_words[tens_divisor]
      word += num_words[tens_modulo]
    else
      word += num_words[hundreds_modulo]
    end
  end
  sum += word.length
}
sum += "onethousand".length
puts sum