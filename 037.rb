max_value = 1000000
#max_value = 3797

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
hashed_sieve = {}
sieve.each do |prime|
  hashed_sieve[prime.to_s] = true
end

truncated_primes = []

sieve.each do |prime|
  forward_prime = prime.to_s
  backward_prime = prime.to_s
  prime_split = true
  while forward_prime.size > 1
    forward_prime.slice!(0)
    backward_prime.slice!(-1)
    unless hashed_sieve.include?(forward_prime) and hashed_sieve.include?(backward_prime)
      prime_split = false
      break
    end
  end
  truncated_primes << prime if prime > 9 and prime_split
end

puts truncated_primes.inject(:+)