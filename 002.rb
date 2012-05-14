def fibonnaci_sum(a,b)
  sum = a % 2 == 0 ? a : 0
  return b >= 4000000 ? sum : sum + fibonnaci_sum(b,a+b)
end

puts fibonnaci_sum(1,2)