ceiling = 1_389_026_620
floor = 1_010_101_010

require 'pp'

start_time = Time.now
(floor..ceiling).step(10) do |i|
  num = (i**2).to_s
  if num[16] == '9' && num[14] == '8' && num[12] == '7' && num[10] == '6' && num[8] == '5' && num[6] == '4' && num[4] == '3' && num[2] == '2'
    pp "Original Number: #{i} - Square: #{num}"
    break
  end
end
pp "Found in #{Time.now - start_time} seconds"
