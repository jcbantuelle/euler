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
hashed_sieve = {}
sieve.each do |prime|
  hashed_sieve[prime] = true
end

found = false
i = 33
while i < 1000000
  i += 2
  next if hashed_sieve.include?(i)
  found = true
  sieve.each do |prime|
    next if prime == 2
    break if prime > i
    result = Math.sqrt((i-prime) / 2)
    if result.to_i == result
      found = false
      break
    end
  end
  break if found
end

puts i