require 'pp'

def find_current(matrix, max_index)
  least_value = nil
  least_indicies = []
  0.upto(max_index) do |row|
    0.upto(max_index) do |col|
      node = matrix[row][col]
      if node[:visited] == false && node[:distance] < Float::INFINITY && (least_value.nil? || node[:distance] < least_value)
        least_value = node[:distance]
        least_indicies = [row, col]
      end
    end
  end
  least_indicies
end

matrix = Array.new

rows = IO.readlines('matrix_83.txt')
rows.each_with_index do |row, index|
  matrix[index] = row.split(',').map(&:to_i)
end

# matrix = [
#   [131, 673, 234, 103, 18],
#   [201, 96, 342, 965, 150],
#   [630, 803, 746, 422, 111],
#   [537, 699, 497, 121, 956],
#   [805, 732, 524, 37, 331]
# ]

matrix = matrix.map{ |row|
  row.map{ |cell|
    {value: cell, distance: Float::INFINITY, visited: false}
  }
}

max_index = matrix.size - 1

matrix[0][0][:distance] = matrix[0][0][:value]

while !matrix[max_index][max_index][:visited] do
  indicies = find_current(matrix, max_index)
  row = indicies[0]
  col = indicies[1]

  break if row == max_index && col == max_index

  node = matrix[row][col]

  unless row == 0
    distance = node[:distance] + matrix[row-1][col][:value]
    matrix[row-1][col][:distance] = distance if distance < matrix[row-1][col][:distance]
  end

  unless col == 0
    distance = node[:distance] + matrix[row][col-1][:value]
    matrix[row][col-1][:distance] = distance if distance < matrix[row][col-1][:distance]
  end

  unless row == max_index
    distance = node[:distance] + matrix[row+1][col][:value]
    matrix[row+1][col][:distance] = distance if distance < matrix[row+1][col][:distance]
  end

  unless col == max_index
    distance = node[:distance] + matrix[row][col+1][:value]
    matrix[row][col+1][:distance] = distance if distance < matrix[row][col+1][:distance]
  end

  matrix[row][col][:visited] = true
end

pp matrix[max_index][max_index][:distance]

# require 'pp'

# $matrix = Array.new

# rows = IO.readlines('matrix_83.txt')
# rows.each_with_index do |row, index|
#   $matrix[index] = row.split(',').map(&:to_i)
# end

# # $matrix = [
# #   [131, 673, 234, 103, 18],
# #   [201, 96, 342, 965, 150],
# #   [630, 803, 746, 422, 111],
# #   [537, 699, 497, 121, 956],
# #   [805, 732, 524, 37, 331]
# # ]

# $max_index = $matrix.size-1

# $matrix_answers = []
# 0.upto($max_index) do |i|
#   row = Array.new($max_index+1)
#   $matrix_answers << row
# end
# $matrix_answers[$max_index][$max_index] = $matrix[$max_index][$max_index]

# def clone_matrix(m)
#   Marshal.load(Marshal.dump(m))
# end

# def min_path(row, col, sum)
#   if $matrix_answers[row] && $matrix_answers[row][col]
#     sum += $matrix_answers[row][col]
#     $base_min = sum if sum < $base_min
#     return
#   else
#     sum += $matrix[row][col]
#   end

#   if row == $max_index && col == $max_index
#     $base_min = sum if sum < $base_min
#     return
#   end
#   return if sum >= $base_min

#   if $memo_matrix[row][col] && sum >= $memo_matrix[row][col]
#     return
#   else
#     $memo_matrix[row][col] = sum
#   end

#   if row < $max_index
#     min_path(row+1, col, sum)
#   end

#   if col < $max_index
#     min_path(row, col+1, sum)
#   end

#   if row > 0
#     min_path(row-1, col, sum)
#   end

#   if col > 0
#     min_path(row, col-1, sum)
#   end
# end

# ($max_index-1).downto(0) do |row|
#   col = $max_index
#   while col >= 0 && row <= $max_index
#     $base_min = []
#     $base_min << $matrix_answers[row][col+1] if col+1 <= $max_index
#     $base_min << $matrix_answers[row+1][col] if row+1 <= $max_index
#     $base_min = $base_min.min + $matrix[row][col]
#     $memo_matrix = clone_matrix($matrix_answers)
#     min_path(row, col, 0)
#     $matrix_answers[row][col] = $base_min
#     row += 1
#     col -= 1
#   end
# end

# ($max_index-1).downto(0) do |col|
#   row = 0
#   while col >= 0 && row <= $max_index
#     $base_min = []
#     $base_min << $matrix_answers[row][col+1] if col+1 <= $max_index
#     $base_min << $matrix_answers[row+1][col] if row+1 <= $max_index
#     $base_min = $base_min.min + $matrix[row][col]
#     $memo_matrix = clone_matrix($matrix_answers)
#     min_path(row, col, 0)
#     $matrix_answers[row][col] = $base_min
#     row += 1
#     col -= 1
#   end
# end

# pp $matrix_answers[0][0]