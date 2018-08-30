require 'pp'

too_big = 0.5
too_small = 1.0/3
existing_fractions = {}

start_time = Time.now
2.upto(12_000) do |d|
  ((d*too_small).to_i).upto(d-1) do |n|
    calculation = n.to_f/d
    break if calculation >= too_big
    existing_fractions[calculation.to_s] = true unless calculation <= too_small
  end
end
pp "Found in #{Time.now - start_time} seconds"

pp existing_fractions.size
