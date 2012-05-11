triangle = 0
counter = 1
while true
  
  # Find next Triangle number
  triangle = triangle + counter

  # Factor Triangle number
  factors = 2
  (2..(Math.sqrt(triangle))).each { |i|
    factors += 2 if triangle % i == 0
  }
    
  break if factors > 500
  counter += 1
end

puts triangle