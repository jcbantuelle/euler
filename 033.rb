fractions = 1.0
10.upto(99) do |numerator|
  numerator.upto(99) do |denominator|
    next if denominator == numerator
    if numerator.to_s[1] == denominator.to_s[0]
      new_numerator = numerator.to_s[0].to_i
      new_denominator = denominator.to_s[1].to_i
      unless new_denominator == 0
        if Float(numerator)/Float(denominator) == Float(new_numerator)/Float(new_denominator)
          fractions *= (Float(new_numerator)/Float(new_denominator))
        end
      end
    end
  end
end

puts 1 / fractions