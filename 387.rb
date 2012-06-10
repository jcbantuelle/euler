primes_array = []
primes_hash = {}

file = IO.readlines('primes.txt')
file.each do |prime|
  prime = prime.to_i
  break if prime > 10000
  primes_array << prime
  primes_hash[prime] = true
end

primes_array.each do |prime|
  
end