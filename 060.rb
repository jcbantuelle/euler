primes_array = []
primes_hash = {}

file = IO.readlines('primes.txt')
file.each do |prime|
  prime = prime.to_i
  primes_array << prime
  primes_hash[prime] = true
end

puts "Finished Primes"

concatenations = Array.new
found = false

primes_array.each do |prime|
  next if prime == 2 or prime == 5
  new_concatenations = Array.new
  concatenations.each do |concatenation|
    is_valid = true
    concatenation.each do |concatenation_prime|
      new_prime = (concatenation_prime.to_s + prime.to_s).to_i
      new_prime2 = (prime.to_s + concatenation_prime.to_s).to_i
      if !primes_hash.include?(new_prime) or !primes_hash.include?(new_prime2)
        is_valid = false
        break
      end
    end
    if is_valid
      new_concatenation = concatenation + [prime]
      new_concatenations << new_concatenation
      if new_concatenation.size == 5
        puts new_concatenation.to_s
        puts new_concatenation.inject(:+)
        found = true
      end
    end
  end
  break if found
  concatenations += new_concatenations
  concatenations << [prime]
end