factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

total = 0
10.upto(999999) do |number|
  checksum = 0
  number.to_s.split(//).each{|digit| checksum += factorials[digit.to_i]}
  total += number if checksum == number
end

puts total