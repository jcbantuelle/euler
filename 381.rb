max_value = 10**8
#max_value = 100

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

puts "Found the primes"

factorial_cache = {:index => 0, :value => 1}

sum = 0
sieve.each do |prime|
  sp_sum = 0
  
  next if prime < 5
  prime_index = prime-5
  if factorial_cache[:index] > (prime_index)
    sp = 1
    (prime_index).downto(1) do |i|
      sp *= i
    end
  else
    sp = factorial_cache[:value]
    (prime_index).downto(factorial_cache[:index]+1) do |i|
      sp *= i
    end
  end
  
  sp_sum += sp
  
  4.downto(1) do |i|
    sp *= (prime-i)
    sp_sum += sp
  end
  
  sp_sum -= 1 if prime == 5

  factorial_cache[:index] = prime
  factorial_cache[:value] = sp
  
  sum += (sp_sum % prime)
end

puts sum