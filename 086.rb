require 'pp'

total = 0
m = 0

while total < 1_000_000
  m += 1
  1.upto(m) do |b|
    1.upto(b) do |a|
      total += 1 if Math.sqrt((a+b)**2+m**2) % 1 == 0
    end
  end
end

pp m