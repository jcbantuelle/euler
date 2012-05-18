largest = 0

1.upto(99999) do |i|
  counter = 2
  pandigital = i.to_s
  while pandigital.size < 9
    pandigital += (i*counter).to_s
    largest = pandigital if pandigital.size == 9 and pandigital.split(//).sort.join('') == '123456789' and pandigital.to_i > largest.to_i
    counter += 1
  end
end

puts largest