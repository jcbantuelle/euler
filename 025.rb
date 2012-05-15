fibonacci = [1,1]
index = 1

while fibonacci[index].to_s.length < 1000
  fibonacci << fibonacci[index] + fibonacci[index-1]
  index += 1
end

puts index+1