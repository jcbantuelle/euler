primes_array = []
primes_hash = {}

file = IO.readlines('primes.txt')
file.each do |prime|
  prime = prime.to_i
  primes_array << prime
  primes_hash[prime] = true
end

puts primes_array.size

#sum = 1
#2.upto(100_000_000) do |n|
#  puts n if n % 100_000 == 0
#  if primes_hash.include?(n)
#    sum += 1
#    next
#  end
#  
#  factored = n
#  primes_array.each do |prime|
#    while factored % prime == 0
#      factored /= prime
#      sum += 1
#    end
#    if primes_hash.include?(factored)
#      sum += 1
#      break
#    end
#    break if factored == 1
#  end
#end
#
#puts sum