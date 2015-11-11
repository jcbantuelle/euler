diagonals = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25]
pascal = {}

diagonals.each do |diagonal|
  pascal[diagonal] = [1]
end

1.upto(50) do |i|
  diagonals.each do |diagonal|
    pascal[diagonal] << pascal[diagonal][i-1] * (diagonal+i) / i
  end
end

total = 1
0.upto(47) do |i|
  0.upto(i/4) do |j|
    total += pascal[diagonals[j]][i-(j*4)]
  end
end
puts total
