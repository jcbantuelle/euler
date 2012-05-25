sum = 0

1000.upto(99999) do |product|
  2.upto(Math.sqrt(product)) do |factor|
    if product % factor == 0
      factor_two = product / factor
      product_string = product.to_s + factor.to_s + factor_two.to_s
      product_array = []
      product_string.each_char{|char| product_array << char}
      if product_array.sort == %w(1 2 3 4 5 6 7 8 9)
        sum += product
        break
      end
    end
  end
end

puts sum