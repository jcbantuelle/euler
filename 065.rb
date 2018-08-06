e_digits = [2]
#e_numerators = [2,3]

2.step(66, 2) do |i|
  e_digits << 1
  e_digits << i
  e_digits << 1
end

# 2.upto(99) do |i|
#   e_numerators << e_digits[i] * e_numerators[i-1] + e_numerators[i-2]
# end
# 
# answer = 0
# e_numerators[99].to_s.each_char { |c| answer += c.to_i }
# puts answer

sum = 0
9.downto(1) do |i|
  sum = e_digits[i] + (1.0 / sum)
  #sum = 1.0 / (sum + e_digits[i])
end

sum += e_digits[0]
answer = 0
sum.rationalize.numerator.to_s.each_char {|c| answer += c.to_i }
puts answer