def is_prime(number)
  2.upto(Math.sqrt(number)) do |factor|
    return false if number % factor == 0
  end
  true
end

primes_array = []
primes_hash = {}
largest_prime = 0

file = IO.readlines('primes.txt')
file.each do |prime|
  prime = prime.to_i
  primes_array << prime
  primes_hash[prime] = true
  largest_prime = prime
end

puts "Finished Primes"

counter = 3
location = 9
primes = 3
numbers = 5
while (primes.to_f / numbers.to_f > 0.1)
  counter += 2
  1.upto(4) do
    location += (counter-1)
    primes += 1 if (location > largest_prime and is_prime(location)) or primes_hash.include?(location)
  end
  numbers += 4
end

puts counter