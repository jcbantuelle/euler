file = IO.readlines('cipher_59.txt')
cipher_values = Array.new
file.each do |cipher|
  cipher_values = cipher.split(/,/).map{|number| number.to_i}
end

found = false

("a".ord).upto("z".ord) do |key1|
  ("a".ord).upto("z".ord) do |key2|
    ("a".ord).upto("z".ord) do |key3|
      decipher = Array.new(cipher_values)
      decipher.each_index do |index|
        decipher[index] = decipher[index] ^ key1 if index % 3 == 0
        decipher[index] = decipher[index] ^ key2 if index % 3 == 1
        decipher[index] = decipher[index] ^ key3 if index % 3 == 2
      end
      decrypted = decipher.map{|letter| letter.chr}.join('')
      if decrypted.include?(" the ")
        puts decipher.inject(:+)
        found = true
      end
      break if found
    end
    break if found
  end
  break if found
end