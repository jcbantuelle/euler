sum = 1
location = 1
(3..1001).step(2) do |i|
  1.upto(4) do
    location += (i-1)
    sum += location
  end
end

puts sum