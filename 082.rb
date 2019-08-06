require 'pp'

matrix = Array.new

rows = IO.readlines('matrix_82.txt')
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

matrix_answers = []
0.upto(matrix.size-1) do |i|
  row = Array.new(matrix.size)
  row[matrix.size-1] = matrix[i][matrix.size-1]
  matrix_answers << row
end

(matrix.size-2).downto(0) do |col|
  (matrix.size-1).downto(0) do |row|
    starting_number = matrix[row][col]
    options = [starting_number + matrix_answers[row][col+1]]

    down_total = starting_number
    (row-1).downto(0) do |down_row|
      down_total += matrix[down_row][col]
      options << (down_total + matrix_answers[down_row][col+1])
    end

    up_total = starting_number
    (row+1).upto(matrix.size-1) do |up_row|
      up_total += matrix[up_row][col]
      options << (up_total + matrix_answers[up_row][col+1])
    end

    matrix_answers[row][col] = options.min
  end
end

pp matrix_answers.map{|m| m[0]}.min