$currencies = [200, 100, 50, 20, 10, 5, 2, 1]

def spend(currency_index, amount)
  return 1 if currency_index == 7 or amount == 0

  remainder = amount - $currencies[currency_index]
  return spend(currency_index+1, amount) if remainder < 0
    
  return spend(currency_index, remainder) + spend(currency_index+1, amount)
end

puts spend(0, 200)