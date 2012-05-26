triangle_numbers = {}
term = 0
n = 1
while term <= 192
  term = (n*(n+1))/2
  triangle_numbers[term] = n
  n += 1
end

words = IO.read('/Users/justin/Desktop/words.txt')
triangle_count = 0
words.split(/,/).each do |word|
  word.slice!(0)
  word.slice!(-1)
  sum = word.unpack('U*').map{|number| number - 64}.inject(:+)
  triangle_count += 1 if triangle_numbers.include?(sum)
end

puts triangle_count