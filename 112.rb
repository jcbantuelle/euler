require 'pp'

def bouncy(n)
  digits = n.to_s.chars.map(&:to_i)
  return false if digits.length == 1
  if digits[0] < digits[1]
    directionality = 'ascending'
  elsif digits[0] == digits[1]
    directionality = 'equal'
  else
    directionality = 'descending'
  end
  1.upto(digits.length-2) do |i|
    if directionality == 'equal'
      if digits[i] < digits[i+1]
        directionality = 'ascending'
      elsif digits[i] > digits[i+1]
        directionality = 'descending'
      end
    else
      return true if (directionality == 'ascending' && digits[i] > digits[i+1]) || (directionality == 'descending' && digits[i] < digits[i+1])
    end
  end
  false
end

count = 0
bouncy = 0
bouncy_ratio = 0
while bouncy_ratio != 0.99
  count += 1
  bouncy += 1 if bouncy(count)
  bouncy_ratio = bouncy.to_f/count
end

pp count
