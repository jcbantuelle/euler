sum = 0

1000.upto(99999) do |product|
  2.upto(Math.sqrt(product)) do |factor|
    if product % factor == 0
      factor_two = product / factor
      if (product.to_s + factor.to_s + factor_two.to_s).split(//).sort.join('') == '123456789'
        sum += product
        break
      end
    end
  end
end

puts sum