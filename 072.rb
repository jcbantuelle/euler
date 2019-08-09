require 'pp'

def prime_factors(n)
  prime_factors = Array.new

  while n % 2 == 0
    prime_factors << 2
    n = n / 2
  end

  (3..Math.sqrt(n).floor).step(2) do |i|
    while n % i == 0
      prime_factors << i
      n = n / i
    end
  end

  prime_factors << n if n > 2

  prime_factors.uniq
end

pp (2..1_000_000).to_a.reduce(0) { |total, n|
  total + prime_factors(n).reduce(n) { |product, factor| product * (1.0 - 1.0/factor) }.to_i
}