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

min_n_over_phi = 100
min_n_over_phi_n = 1

2.upto(10**7) do |n|
  phi = prime_factors(n).reduce(n) { |product, factor| product * (1.0 - 1.0/factor) }.to_i

  if n.to_s.chars.sort == phi.to_s.chars.sort
    n_over_phi = n.to_f / phi
    if n_over_phi < min_n_over_phi
      min_n_over_phi = n_over_phi
      min_n_over_phi_n = n
    end
  end
end

pp "Min n/phi n: #{min_n_over_phi_n}"
pp "Min n/phi: #{min_n_over_phi}"
