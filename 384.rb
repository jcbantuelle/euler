# substitution = {
#   "1 1" => "1 1 1 -1",
#   "1 -1" => "1 1 -1 1",
#   "-1 1" => "-1 -1 1 -1",
#   "-1 -1" => "-1 -1 -1 1"
# }

# string = "1 1 1 -1"

# 1.upto(24) do
#   parsed = string.scan(/-?\d\s-?\d/)
#   string = string + " " + parsed.slice(parsed.size/2..parsed.size).map{|i| substitution[i]}.join(" ")
# end

# fibonacci_index = 2
# t = 2
# c = 1

# sum = 0

# string.split(/\s/).each_with_index do |number, index|
#   sum += number.to_i
#   if seen.include?(sum)
#     seen[sum] += 1
#     if sum == t and seen[sum] == c
#       t_even = t % 2 == 0
#       c_even = c % 2 == 0
#       index_even = index % 2 == 0
#       puts "g(#{t_even ? "E" : "O"}, #{c_even ? "E" : "O"}) = #{index_even ? "E" : "O"}"
#       #puts "g(#{t}, #{c}) = #{index}"
#       fibonacci_index += 1
#       c = t
#       t = fibonacci[fibonacci_index]
#     end
#   end
# end
require 'pp'

@fibonacci = []
@fibonacci[0] = 1
@fibonacci[1] = 1

2.upto(45) do |i|
  @fibonacci[i] = @fibonacci[i-1] + @fibonacci[i-2]
end

@sequence_a_lookup = {}
@sequence_b_lookup = {}
@summatory_sequence_index_lookup = {}
@summatory_sequence_lookup = []
@last_summatory_sequence = 0
@last_summatory_index = 0

def sequence_a(n)
  @sequence_a_lookup[n] ||= b = n.to_s(2); b.count('1') - b.split(/0+/).count
end

def sequence_b(n)
  @sequence_b_lookup[n] ||= (-1)**sequence_a(n)
end

def summatory_sequence(n)
  @summatory_sequence_lookup[n] || -> {
    @last_summatory_index.upto(n) do |i|
      @sum = @last_summatory_sequence + sequence_b(i)

      @last_summatory_sequence = @sum
      @summatory_sequence_lookup << @sum
      if @summatory_sequence_index_lookup[@sum]
        @summatory_sequence_index_lookup[@sum] << @last_summatory_index
      else
        @summatory_sequence_index_lookup[@sum] = [@last_summatory_index]
      end
      @last_summatory_index += 1
    end
    @sum
  }.call
end

def g_t_c(t, c)
  if @summatory_sequence_index_lookup[t].nil? || @summatory_sequence_index_lookup[t][c-1].nil?
    summatory_sequence(t*t)
  end
  @summatory_sequence_index_lookup[t][c-1]
end

pp g_t_c(100,1)
# seq = []
# 1.upto(15) do |i|
#   seq << g_t_c(i, 1)
# end
# pp seq.join(", ")