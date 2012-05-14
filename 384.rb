fibonacci = []
seen = {}
fibonacci[0] = 1
fibonacci[1] = 1


2.upto(45) do |i|
  fibonacci[i] = fibonacci[i-1] + fibonacci[i-2]
  seen[fibonacci[i]] = 0
end

substitution = {
  "1 1" => "1 1 1 -1",
  "1 -1" => "1 1 -1 1",
  "-1 1" => "-1 -1 1 -1",
  "-1 -1" => "-1 -1 -1 1"
}

string = "1 1 1 -1"

1.upto(15) do
  parsed = string.scan(/-?\d\s-?\d/)
  string = string + " " + parsed.slice(parsed.size/2..parsed.size).map{|i| substitution[i]}.join(" ")
end

fibonacci_index = 2
t = 2
c = 1

sum = 0
sn = ""

string.split(/\s/).each_with_index do |number, index|
  sum += number.to_i
  sn += "#{sum} "
  if seen.include?(sum)
    seen[sum] += 1
    if sum == t and seen[sum] == c
      #puts "g(#{t}, #{c}) = #{index}"
      fibonacci_index += 1
      c = t
      t = fibonacci[fibonacci_index]
    end
  end
end

puts sn