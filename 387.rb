require 'pp'
require 'prime'

primes = []

class Integer
  def sum_of_digits
    self.to_s.chars.map(&:to_i).reduce(&:+)
  end

  def harshad_number?
    self % sum_of_digits == 0
  end
end

previous_harshad_iteration = (10..99).to_a.select(&:harshad_number?)

power_of_ten = 14

start_time = Time.now
(power_of_ten-2).times do |exponent|
  next_harshad_iteration = []
  previous_harshad_iteration.each do |harshad_number|
    is_strong = Prime.prime?(harshad_number/harshad_number.sum_of_digits)
    new_h = harshad_number*10
    0.upto(9) do |i|
      h = new_h + i
      next_harshad_iteration << h if h.harshad_number?
      primes << h if is_strong && Prime.prime?(h)
    end
  end
  previous_harshad_iteration = next_harshad_iteration
end
pp "Found in #{Time.now - start_time} seconds"

pp primes.inject(&:+)
