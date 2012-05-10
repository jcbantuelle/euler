def is_prime(a, primes)
  primes.each do |prime|
    return false if a % prime == 0 
  end
  return true
end

primes = [2]
counter = 1

while primes.count < 10001
	counter += 2
	if is_prime(counter, primes)
	  primes << counter
  end
end

puts counter