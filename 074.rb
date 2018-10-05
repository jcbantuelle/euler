require 'pp'

class String
  FACTORIALS = {
    '0' => 1,
    '1' => 1,
    '2' => 2,
    '3' => 6,
    '4' => 24,
    '5' => 120,
    '6' => 720,
    '7' => 5040,
    '8' => 40320,
    '9' => 362880
  }

  def factorial
    FACTORIALS[self]
  end
end

class Integer
  def sum_of_digit_factorials
    self.to_s.chars.map(&:factorial).reduce(&:+)
  end
end

chains = {}

start_time = Time.now
1.upto(999_999) do |start|
  next_number = start
  visited_numbers = []
  while !chains[next_number] do
    visited_numbers << next_number
    chains[next_number] = []
    visited_numbers.each do |visited_number|
      chains[visited_number] << next_number
    end
    next_number = next_number.sum_of_digit_factorials
  end
  visited_numbers.each do |visited_number|
    chains[visited_number] = (chains[visited_number] + chains[next_number]).uniq unless chains[visited_number].include?(next_number)
  end
end
pp "Found in #{Time.now - start_time} seconds"

pp chains.select { |start, chain| start < 1_000_000 && chain.size == 60 }.size
