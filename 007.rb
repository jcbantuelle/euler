max_value = 1000000

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
puts sieve[10000]