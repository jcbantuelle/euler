number = '28433'
1.upto(7830457) do |i|
  number = (number.to_i*2).to_s
  number = number.length < 10 ? number : number.slice(-10..-1)
end

number = number.to_i + 1
puts number