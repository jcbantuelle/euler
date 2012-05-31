total = 0
factorials = {}
factorials[0] = 1
1.upto(100) do |n|
  factorials[n] = factorials[n-1] * n
  0.upto(n) do |r|
    value = factorials[n] / (factorials[r] * factorials[n-r])
    total += 1 if value > 1000000
  end
end

puts total