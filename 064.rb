odd_periods = 0

2.upto(10000) do |num|
  start_a = Math.sqrt(num).floor
  next if start_a**2 == num
  
  a = start_a
  m = 0
  d = 1
  tracking = []

  until tracking.include?("#{m}+#{d}+#{a}")
    tracking << "#{m}+#{d}+#{a}"
    m = d*a - m
    d = (num - m**2) / d
    a = ((start_a + m) / d).floor
  end
  
  odd_periods += 1 if tracking.length % 2 == 0  
end

puts odd_periods