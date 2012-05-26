sum = 0
[9,8,7,6,5,4,3,2,1,0].permutation.each do |permute|
  number = permute.join('')
  if number.slice(1,3).to_i % 2 == 0
    if number.slice(2,3).to_i % 3 == 0
      if number.slice(3,3).to_i % 5 == 0
        if number.slice(4,3).to_i % 7 == 0
          if number.slice(5,3).to_i % 11 == 0
            if number.slice(6,3).to_i % 13 == 0
              if number.slice(7,3).to_i % 17 == 0
                sum += number.to_i
              end
            end
          end
        end
      end
    end
  end
end

puts sum