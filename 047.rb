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

target = 4
consecutive = 0
first = 0
n = 4
while consecutive < target
  # If the number is prime, reset
  if hashed_sieve.include?(n)
    consecutive = 0
  # Factor number
  else
    factored = n
    factors = 0
    
    # Find the prime factorization
    sieve.each do |prime|
      if factored % prime == 0
        factors += 1
        while factored % prime == 0
          factored /= prime
        end
      end
      
      # We've fully factored the number
      if factored == 1
        # It's got the right number of factors
        if factors == target
          # Start our tracking if it's the first in a new set
          if consecutive == 0
            first = n
          end
          consecutive += 1
        else
          consecutive = 0
        end
        break
      end
      
      # Number has too many factors
      if factors == target
        consecutive = 0
        break
      end
      
    end
    
  end
  n += 1
end

puts first