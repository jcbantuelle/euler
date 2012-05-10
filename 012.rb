def triangle(i)
	sum = 0
	(1..i).each { |j|
	  sum += j
	}
	sum
end

def factors(i)
  total = 2
  (2..(i/2)).each { |j|
    total += 1 if i % j == 0
  }
  total
end

counter = 1
while true
  num = triangle(counter)
  factor = factors(num)
  puts num.to_s + ": " + factor.to_s
  break if factor > 500
  counter += 1
end

puts num