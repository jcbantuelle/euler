sum = 0
num = 2**1000
num.to_s.each_char { |i|
	sum += i.to_i
}
puts sum