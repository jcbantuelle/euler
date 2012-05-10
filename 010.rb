max_value = 2000000
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

sum = 0
sieve.compact!
sieve.each { |index| 
  sum += index[0]
}
puts sum