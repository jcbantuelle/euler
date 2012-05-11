chain_length = 0
chain_number = 0

chain_lookup = {}

(1..999999).each { |i|
  start = i
  counter = 1
  while i != 1
    unless chain_lookup[i].nil?
      counter += chain_lookup[i] - 1
      break
    end
    if i % 2 == 0
      i = i/2
    else
      i = 3*i+1
    end
    counter += 1
  end
  chain_lookup[start] = counter
  if counter > chain_length
    chain_length = counter
    chain_number = start
  end
}

puts chain_number