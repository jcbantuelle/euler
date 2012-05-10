def fibonnaci_sum(a,b)
  sum = a % 2 == 0 ? a : 0
  if b >= 4000000
    return sum
  end
  return sum + fibonnaci_sum(b,a+b)
end

a = 1
b = 2

puts fibonnaci_sum(1,2)