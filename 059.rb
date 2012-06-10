file = IO.readlines('cipher_59.txt')
cipher_values = Array.new
file.each do |cipher|
  cipher_values = cipher.split(/,/).map{|number| number.to_i}
end

key1 = 103
key2 = 111
key3 = 100

decipher = Array.new(cipher_values)
decipher.each_index do |index|
  decipher[index] = decipher[index] ^ key1 if index % 3 == 0
  decipher[index] = decipher[index] ^ key2 if index % 3 == 1
  decipher[index] = decipher[index] ^ key3 if index % 3 == 2
end

puts decipher.inject(:+)