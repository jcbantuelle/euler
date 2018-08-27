require 'pp'

matrix = Array.new

rows = IO.readlines('matrix_81.txt')
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

max_row = max_col = matrix.size - 1

max_row.downto(0) do |row|
  max_col.downto(0) do |col|
    if row == max_row && col == max_col
      min = 0
    elsif col == max_col
      min = matrix[row+1][col]
    elsif row == max_row
      min = matrix[row][col+1]
    else
      min = [matrix[row+1][col], matrix[row][col+1]].min
    end
    matrix[row][col] += min
  end
end

puts matrix[0][0]
