require 'pp'

biggest = 0
line_number = 0

rows = IO.readlines('base_exp_99.txt')
rows.each_with_index do |row, index|
  numbers = row.split(',').map(&:to_i)
  a = numbers[0]
  b = numbers[1]
  digits = 1 + b * Math.log10(a)
  if digits > biggest
    biggest = digits
    line_number = index+1
  end
end

puts line_number
