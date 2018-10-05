winners = 0
1.upto(2**30) do |n|
  winners += 1 if n ^ (n*2) ^ (n*3) == 0
  puts n if n % 10_000_000 == 0
end
puts winners
