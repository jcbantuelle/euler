def is_prime(a)
  return false if a % 2 == 0
  (3..(a / 2)).step(2) { |i| 
    return false if a % i == 0
  }
  return true
end

factor = 600851475143
(775146).downto(1) { |i|
  if factor % i == 0 and is_prime(i)
    puts i
    break
  end
}