max_value = 10000
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

amicable = []

# Prepare Amicable Number Hash
amicable_numbers = {}
1.upto(10000) do |i|
  amicable_numbers[i] = nil
end

# Flag Primes
sieve.compact!
sieve.each { |num|
  amicable_numbers[num[0]] = 1
}

# Calculate Divisors
1.upto(10000) do |i|
  if amicable_numbers[i].nil?
    divisors = [1]
    (i/2).downto(2) do |j|
      if i % j == 0
        divisors << j
      end
    end
    amicable_numbers[i] = divisors.inject(:+)
  end
end

# Count Amicable Numbers
1.upto(10000) do |i|
  unless amicable.include?(i) or amicable_numbers[i] == 1
    divisor = amicable_numbers[i]
    amicable_divisor = amicable_numbers[divisor]
    if amicable_divisor == i and amicable_divisor != divisor
      amicable << i
      amicable << divisor
    end
  end
end

puts amicable.inject(:+)