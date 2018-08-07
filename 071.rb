require 'pp'

too_big = 3.0/7
fractions = [["2/5", 0.4], ["3/7", too_big]]
existing_fractions = {"2/5" => true, "3/7" => true}
closest = 0.4

2.upto(1_000_000) do |d|
  ((d*closest).to_i).upto(d-1) do |n|
    calculation = n.to_f/d
    break if calculation > too_big
    unless existing_fractions[calculation.to_s]
      fractions << ["#{n}/#{d}", calculation]
      existing_fractions[calculation.to_s] = true
      closest = calculation if calculation > closest
    end
  end
  pp "Finished Processing #{d}: # of fractions #{existing_fractions.count}" if d % 1_000 == 0
end

fractions.sort!{ |a, b| a[1] <=> b[1] }
three_sevenths_index = fractions.find_index{|f| f[0] == '3/7'}
pp fractions[three_sevenths_index-1][0]
