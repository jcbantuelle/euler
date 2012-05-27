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

best_consecutive = 0
best_prime = 0

sieve.each_with_index do |prime, index|
  new_number = prime
  new_consecutive = 1
  index += 1
  while new_number < 1000000 and !sieve[index].nil?
    new_number += sieve[index]    
    if hashed_sieve.include?(new_number)
      if new_consecutive > best_consecutive
        best_consecutive = new_consecutive
        best_prime = new_number
      end
    end
    new_consecutive += 1
    index += 1
  end
end

puts best_prime