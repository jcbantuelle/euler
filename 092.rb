require 'pp'

def sum_of_squares(chains, exploration, number)
  number = number.to_s
  if chains.has_key?(number)
    exploration.each do |e|
      chains[e] = chains[number]
    end
    return chains
  else
    exploration << number
    sum = 0
    number.each_char { |n|
      sum += n.to_i**2
    }
    return sum_of_squares(chains, exploration, sum)
  end
end

chains = {
  '1' => '1',
  '89' => '89'
}

2.upto(9_999_999) do |i|
  chains = sum_of_squares(chains, Array.new, i)
end

puts chains.select{ |k, v| v == '89' && k.to_i < 10_000_000 }.count
