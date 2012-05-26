pentagonal = []
pentagonal_lookup = {}
1.upto(10000) do |i|
  number = (i*(3*i-1))/2
  pentagonal << number
  pentagonal_lookup[number] = true
end

d = 5000000000000
pentagonal.each do |j|
  pentagonal.each do |k|
    absolute_value = (j-k).abs
    if pentagonal_lookup.include?(j+k) and pentagonal_lookup.include?(absolute_value)
      d = absolute_value if absolute_value < d
    end
  end
end

puts d