max_value = 9999

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
  hashed_sieve[prime] = true
end

sequence_primes = []
sieve.each do |prime|
  next if prime < 1000
  primes = []
  prime.to_s.split(//).permutation.to_a.uniq.each do |permute|
    new_prime = permute.join('').to_i
    next if new_prime < 1000
    primes << new_prime if hashed_sieve.include?(new_prime)
  end
  if primes.size > 2
    primes.sort!
    primes.each do |prime1|
      primes.each do |prime2|
        next if prime2 <= prime1
        diff = prime2 - prime1
        sequence_primes << prime1.to_s + prime2.to_s + (prime2+diff).to_s if primes.include?(prime2+diff)
      end
    end
  end
end

puts sequence_primes.uniq.reject{|i| i == '148748178147'}