def operate(operation, first, *rest)
  result = []
  first.zip(*rest) do |i|
    result << i.inject(operation)
  end
  result
end

z1 = [-4.0,-3.0]
z2 = [-4.0,3.0]
z3 = [8.0,0.0]

one_third = [1.0/3.0, 1.0/3.0]
g = operate(:*, one_third, operate(:+,z1,z2,z3))
g2 = operate(:*, g, g)

puts g2.to_s

sum = operate(:+, operate(:*, z1, z2), operate(:*, z2, z3), operate(:*, z1, z3))
foci = operate(:-, g2, operate(:*, one_third, sum))

puts foci.to_s