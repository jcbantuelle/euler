# Expand dividend until it can be divided
def expand_dividend(divisor, dividend)
  while dividend < divisor
    dividend = "#{dividend}0".to_i
  end
  dividend
end

def long_division(divisor, dividend)
  count = 1
  previous_dividends = {}
  while true
    previous_dividends[dividend] = true
    dividend = dividend % divisor
    dividend = expand_dividend(divisor, dividend)
    break if previous_dividends.include?(dividend)
    count += 1
  end
  count
end

longest = {:length => 0, :value => 2}

3.upto(999) do |divisor|
  count = 0
  previous_dividends = {}
  dividend = expand_dividend(divisor, 1)
  
  while true
    break if dividend % divisor == 0
    previous_dividends[dividend] = true
    dividend = dividend % divisor
    dividend = expand_dividend(divisor, dividend)
    if previous_dividends.include?(dividend)
      count = long_division(divisor, dividend)
      break
    end
  end
  
  # If larger than previous longest, save it
  if count > longest[:length]
    longest[:length] = count
    longest[:value] = divisor
  end
end

puts longest[:value]