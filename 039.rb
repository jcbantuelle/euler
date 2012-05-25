max_solutions = 0
max_perimeter = 0
3.upto(1000) do |perimeter|
  solutions = 0
  1.upto(perimeter/3) do |a|
    a.upto(perimeter-a) do |b|
      break if perimeter - a - b < b
      solutions += 1 if (perimeter - a - b) == Math.sqrt(a**2 + b**2)
    end
  end
  if solutions > max_solutions
    max_solutions = solutions
    max_perimeter = perimeter
  end
end

puts max_perimeter