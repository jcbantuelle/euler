row = Array.new

file = IO.readlines('triangle_18.txt')
row_num = 0
file.each do |record|
  row[row_num] = record.split(/\s/).map{|number| number.to_i}
  row_num += 1
end

13.downto(0) do |i|
  row[i].each_with_index do |val, key|
    left = row[i+1][key]
    right = row[i+1][key+1]
    row[i][key] += [left, right].max
  end
end

puts row[0][0]