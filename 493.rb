require 'pp'

answer = 0.0
1.upto(20) do |i|
  adjustment = i-1
  remaining_balls = 70-(adjustment)
  taken_balls = 10*answer-adjustment
  answer += (remaining_balls - taken_balls)/remaining_balls
end
pp answer
