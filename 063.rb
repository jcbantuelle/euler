exponent = 1
total = 0

while true
  1.upto(9) do |n|
    value = n**exponent
    total += 1 if value.to_s.length == exponent
  end
  break if (9**exponent).to_s.length < exponent
  exponent += 1
end

puts total