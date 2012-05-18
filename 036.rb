sum = 0
1.upto(999999) do |number|
  decimal = number.to_s
  if decimal == decimal.reverse
    binary = number.to_s(2)
    if binary == binary.reverse
      sum += number
    end
  end
end

puts sum