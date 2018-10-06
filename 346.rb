require 'pp'

ceiling = 10**12

repunits = {}

def find_repunit(number, base)
  ((base**(number) - 1) / (base - 1))
end

2.upto(Math.sqrt(ceiling)) do |base|
  counter = 2
  loop do
    repunit = find_repunit(counter, base)
    break if repunit >= ceiling
    if repunit-1 != base
      repunits[repunit] = true
    end
    counter += 1
  end
end

pp repunits.keys.inject(:+)+1
