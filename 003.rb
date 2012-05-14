def is_prime(number)
  2.upto(Math.sqrt(number)) do |factor|
    return false if number % factor == 0
  end
  true
end

composite = 600851475143
biggest_prime = 0

3.upto(Math.sqrt(composite)) do |small_factor|
  if composite % small_factor == 0
    big_factor = composite / small_factor
    
    if is_prime(big_factor)
      biggest_prime = big_factor
      break
    end
    
    biggest_prime = small_factor if is_prime(small_factor)
  end
end

puts biggest_prime