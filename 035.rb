max_value = 1000000

sieve = []
(2..max_value).each { |i| 
  sieve << [i]
}

sieve.each { |index|
  next if index.nil?
  value = index[0]
  (value..max_value).step(value) { |filter|
    sieve[filter-2] = nil if filter != value
  }
}

hashed_sieve = {}

sieve.compact!
sieve.each { |num|
  hashed_sieve[num[0].to_s] = true
}

circular = 0
hashed_sieve.each_key { |prime|
  is_circular = true
  count = 0
  prime.each_char do |char|
    new_prime = prime.slice(count+1, prime.length) + prime.slice(0, count+1)
    unless hashed_sieve.include?(new_prime)
      is_circular = false
      break
    end
    count += 1
  end
  circular += 1 if is_circular
}
puts circular