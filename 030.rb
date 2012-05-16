sum = 0
10.upto(999999) do |i|
  i_sum = i.to_s.split(//).map{|j| (j.to_i)**5}.inject(:+)
  sum += i if i == i_sum
end

puts sum