class Sudoku
  
  attr_accessor :grid
  
  def initialize(grid)
    @grid = grid
    @invalid = false
    @stuck = false
  end
  
  def solve
    until solved? || @stuck
      @stuck = true
      @grid.each_with_index do |value, index|
        solve_square(index) if value == 0
        return if invalid?
      end
    end
    
    guess if @stuck
  end
  
  def guess
    guess_index = @grid.index(0)
    options = valid_options(guess_index)
    options.each do |guess_value|
      new_grid = @grid.dup
      new_grid[guess_index] = guess_value
      sudoku = Sudoku.new(new_grid)
      sudoku.solve
      if sudoku.solved?
        @grid = sudoku.grid
        break
      end
    end
  end
  
  def to_s
    output = ""

    count = 1
    @grid.each do |value|
      output += value.to_s
      output += "\n" if count % 9 == 0
      count += 1
    end
    
    output
  end
  
  def solved?
    !@grid.include?(0)
  end
  
  def invalid?
    @invalid
  end
  
  def solve_square(index)
    options = valid_options(index)
    
    @invalid = options.length == 0
    if options.length == 1
      @stuck = false
      @grid[index] = options[0]
    end
  end
  
  def valid_options(index)
    options = [1,2,3,4,5,6,7,8,9]
    invalid_options = column_values(index)
    invalid_options += row_values(index)
    invalid_options += grid_values(index)
    invalid_options.uniq!
    options.reject {|i| invalid_options.include?(i) }
  end
  
  def column_values(index)
    values = []
    (index % 9).step(80, 9) do |column_index|
      values << @grid[column_index] unless @grid[column_index] == 0
    end
    values
  end
  
  def row_values(index)
    values = []
    row_index = index - (index % 9)
    9.times {
      values << @grid[row_index] unless @grid[row_index] == 0
      row_index += 1
    }
    values
  end
  
  def grid_values(index)
    values = []
    row_start = (index / 27) * 3 * 9
    column_start = ((index % 9) / 3) * 3
    grid_start = row_start + column_start
    0.step(18, 9) do |row|
      0.step(2) do |column|
        grid_index = grid_start + row + column
        values << @grid[grid_index] unless @grid[grid_index] == 0
      end
    end
    values
  end
  
end

puzzles = []

file = IO.readlines('sudoku.txt')
row_num = 0
sudoku_grid = []
file.each do |row|
  row_num += 1
  next if row_num % 10 == 1
  column_count = 0
  row.each_char do |number|
    break if column_count == 9
    sudoku_grid << number.to_i
    column_count += 1
  end
  if row_num % 10 == 0
    puzzles << Sudoku.new(sudoku_grid)
    sudoku_grid = []
  end
end

puzzles.map(&:solve)
answer = 0
puzzles.map{|puzzle| answer += puzzle.grid.slice(0,3).join.to_i }
puts answer

