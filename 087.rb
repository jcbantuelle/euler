max_value = 7078

sieve = []
(2..max_value).each { |i|
  sieve << i
}

sieve.each { |index|
  next if index.nil?
  value = index
  (value..max_value).step(value) { |filter|
    sieve[filter-2] = nil if filter != value
  }
}

sieve.compact!

puts sieve.repeated_permutation(3).map { |primes|
  primes[0]**2 + primes[1]**3 + primes[2]**4
}.select{ |sum|
  sum < 50000000
}.uniq.count
