max = 0
1.upto(100) do |i|
  1.upto(100) do |j|
    sum = (i**j).to_s.split(//).map{|k| k.to_i}.inject(:+)
    max = sum if sum > max
  end
end

puts max