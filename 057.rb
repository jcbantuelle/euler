numerator = 1
denomenator = 2

sum = 0
2.upto(1000) do |i|
  # Expand
  new_denomenator = 2*denomenator + numerator
  numerator = denomenator
  denomenator = new_denomenator
  
  # Add one to expansion check
  sum += 1 if (numerator+denomenator).to_s.length > (denomenator).to_s.length
end

puts sum