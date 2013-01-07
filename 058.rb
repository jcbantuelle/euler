def is_prime(number)
  return false if number % 2 == 0
  (3..Math.sqrt(number)).step(2) do |factor|
    return false if number % factor == 0
  end
  true
end

counter = 3
location = 9
primes = 3
numbers = 5
while primes.to_f / numbers.to_f > 0.1
  counter += 2
  1.upto(4) do
    location += (counter-1)
    primes += 1 if is_prime(location)
  end
  numbers += 4
end

puts counter