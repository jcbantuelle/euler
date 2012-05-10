def palindrome (product)
  return product == product.reverse
end

largest = 0

999.downto(100) { |i|
  999.downto(100) { |j|
    product = i*j
    if product > largest and palindrome(product.to_s)
      largest = product
    end
  }
}

puts largest