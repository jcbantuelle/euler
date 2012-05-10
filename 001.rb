sum = 0
(1..999).each { |i|
  sum += i if i % 3 == 0 or i % 5 == 0
}
puts sum