number = 125874
while true
  found = true
  sorted = number.to_s.split(//).sort
  2.upto(6) do |i|
    new_sorted = (number * i).to_s.split(//).sort
    unless new_sorted == sorted
      found = false
      break
    end
  end
  
  break if found
  number += 1
end

puts number