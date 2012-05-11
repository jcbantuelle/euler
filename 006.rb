sum = 0
square = 0
(1..100).each { |i|
  sum = sum + i**2
  square += i
}
square = square**2
puts square - sum if square > sum
puts sum if sum > square