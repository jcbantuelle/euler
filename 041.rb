def is_prime?(number)
  2.upto(Math.sqrt(number)) do |factor|
    return false if number % factor == 0
  end
  true
end

[7,6,5,4,3,2,1].permutation.to_a.each do |pandigital|
  number = pandigital.join('').to_i
  if is_prime?(number)
    puts number
    break
  end
end