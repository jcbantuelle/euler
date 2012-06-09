primes_array = []
primes_hash = {}

file = IO.readlines('primes.txt')
file.each do |prime|
  prime = prime.to_i
  break if prime > 1000000
  primes_array << prime
  primes_hash[prime] = true
end

factors = []
2.upto(1000000) do |i|
  i_factors = []
  if primes_hash.include?(i)
    i_factors << i
  else
    factored = i
    
    primes_array.each do |prime|
      while factored % prime == 0
        i_factors << prime
        factored /= prime
      end
        
      # We've fully factored the number
      if primes_hash.include?(factored)
        i_factors << factored
        break
      end
      break if factored == 1
    end
  end
  
  factors[i] = i_factors.reverse
end

k = []
target = 2
factors.each_with_index do |factor, index|
  next if factor.nil?
  
  factor.each_with_index do ||
  
  if factor.size == 2
    if (2 + (index - factor.inject(:+))) == target
      k << index
      target += 1
    end
  end
end

puts k.to_s