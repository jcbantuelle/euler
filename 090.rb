options = [0,1,2,3,4,5,6,7,8,9]
sum = 0
seen = {}
options.combination(6).each do |i|
  options.combination(6).each do |j|
    current_combination = i.join('') + j.join('')
    reverse_combination = j.join('') + i.join('')
    next if seen.include?(reverse_combination)
    seen[current_combination] = true
    # 01
    if (i.include?(0) and j.include?(1)) or (i.include?(1) and j.include?(0))
      # 04
      if (i.include?(0) and j.include?(4)) or (i.include?(4) and j.include?(0))
        # 09
        if (i.include?(0) and (j.include?(9) or j.include?(6))) or ((i.include?(9) or i.include?(6)) and j.include?(0))
          # 16
          if (i.include?(1) and (j.include?(9) or j.include?(6))) or ((i.include?(9) or i.include?(6)) and j.include?(1))
            # 25
            if (i.include?(2) and j.include?(5)) or (i.include?(5) and j.include?(2))
              # 36
              if (i.include?(3) and (j.include?(9) or j.include?(6))) or ((i.include?(9) or i.include?(6)) and j.include?(3))
                # 49 / 64
                if (i.include?(4) and (j.include?(9) or j.include?(6))) or ((i.include?(9) or i.include?(6)) and j.include?(4))
                  # 81
                  if (i.include?(8) and j.include?(1)) or (i.include?(1) and j.include?(8))
                    sum += 1
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

puts sum