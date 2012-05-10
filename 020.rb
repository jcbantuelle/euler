factor = 1
2.upto(100) do |i|
  factor *= i
end

sum = 0
factor.to_s.each_char { |c|
  sum += c.to_i
}

puts sum