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

max_n_over_phi = 1
max_n_over_phi_n = 1

2.upto(1_000_000) do |n|
  phi = prime_factors(n).reduce(n) { |product, factor| product * (1.0 - 1.0/factor) }.to_i
  n_over_phi = n.to_f / phi
  if n_over_phi > max_n_over_phi
    max_n_over_phi = n_over_phi
    max_n_over_phi_n = n
  end
end

pp "Max n/phi n: #{max_n_over_phi_n}"
pp "Max n/phi: #{max_n_over_phi}"
