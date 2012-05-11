max_value = 28123

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

filtered = {}

# Flag Primes
sieve.compact!
sieve.each { |num|
  filtered[num[0]] = true
}

abundants = []
abundants_lookup = {}

# Calculate Divisors
12.upto(max_value) do |abundant|
  next unless filtered[abundant].nil?
  sum = 1
  (2..(Math.sqrt(abundant))).each { |factor|
    if abundant % factor == 0
      factor_two = abundant/factor
      sum += factor
      sum += factor_two unless factor == factor_two
    end
  }
  if sum > abundant
    abundants << abundant
    abundants_lookup[abundant] = true
  end
end

sum = 0
1.upto(max_value) do |num|
  abundant_sum = false
  abundants.each do |abundant|
    break if abundant > num
    if abundants_lookup.include?(num - abundant)
      abundant_sum = true
      break
    end
  end
  sum += num unless abundant_sum
end

puts sum