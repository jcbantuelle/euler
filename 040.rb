count = 1
irrational = ""

while true
  irrational << count.to_s
  break if irrational.length > 1000000
  count += 1
end

puts irrational[0].to_i * irrational[9].to_i * irrational[99].to_i * irrational[999].to_i * irrational[9999].to_i * irrational[99999].to_i * irrational[999999].to_i