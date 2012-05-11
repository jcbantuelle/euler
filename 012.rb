triangle = 0
counter = 1
while true
  
  # Find next Triangle number
  triangle = triangle + counter

  # Factor Triangle number
  factors = 2
  square_root = Math.sqrt(triangle)
  (2..square_root).each { |factor|
    if triangle % factor == 0
      factors += factor == square_root ? 1 : 2
    end
  }
    
  break if factors > 500
  counter += 1
end

puts triangle