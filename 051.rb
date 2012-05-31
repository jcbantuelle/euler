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
sieve.each do |prime|
  next if prime < 10
  string_prime = prime.to_s

  string_index = []
  0.upto(string_prime.length-1) do |char_index|
    string_index << char_index
  end
  
  character_substitutions = string_index.combination(3)
  character_substitutions.each do |substitution|
    prime_count = 0
    found_self = false
    0.upto(9) do |replacement_digit|
      new_prime = String.new(string_prime)
      substitution.each do |char_index|
        new_prime[char_index] = replacement_digit.to_s
      end
      next if new_prime[0] == '0'
      new_prime = new_prime.to_i
      if hashed_sieve.include?(new_prime)
        prime_count += 1
        found_self = true if new_prime == prime
      end
    end
    
    if found_self and prime_count == 8
      puts prime
      found = true
      break
    end
  end
  
  break if found
end