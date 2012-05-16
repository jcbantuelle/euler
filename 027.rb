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

best_n = 40
best_a = 1
best_b = 41
(-999).upto(999) do |a|
  (-999).upto(999) do |b|
    n = 0
    while true
      test_prime = n**2 + n*a + b
      unless hashed_sieve.include?(test_prime)
        if n > best_n
          best_n = n
          best_a = a
          best_b = b
        end
        break
      end
      n += 1
    end
  end
end

puts best_a*best_b