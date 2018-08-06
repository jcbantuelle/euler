def solvable_for_y(x, d)
  y = Math.sqrt((x * x - 1.0) / d)
  is_integer?(y)
end

def is_integer?(num)
  num == num.floor
end

largest_x = 0
largest_d = 0
2.upto(1000) do |d|
  next if is_integer?(Math.sqrt(d))
  x = 2
  while !solvable_for_y(x, d) do
    x += 1
  end
  if x > largest_x
    largest_x = x
    largest_d = d
  end
end

puts largest_x
puts largest_d