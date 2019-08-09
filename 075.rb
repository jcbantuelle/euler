require 'pp'

lookup_triangles = {}
m = 2

while m <= 1_500_000  do
  1.upto(m-1) do |n|
    a = m**2 - n**2
    b = 2*m*n
    c = m**2 + n**2
    perimeter = a + b + c
    break if perimeter > 1_500_000
    sides = [a,b,c].sort
    sides_string = sides.join
    lookup_triangles[sides_string] = {
      sides: sides,
      perimeter: perimeter
    } if lookup_triangles[sides_string].nil?
  end
  m += 1
end

triangles = lookup_triangles.map{|_,v| v}.sort{|t1, t2| t1[:perimeter] <=> t2[:perimeter]}
count = 2
not_done = true
while not_done
  triangles.each_with_index do |triangle, i|
    new_sides = [triangle[:sides][0]*count, triangle[:sides][1]*count, triangle[:sides][2]*count]
    perimeter = new_sides.inject(&:+)
    if i == 0 && perimeter > 1_500_000
      not_done = false
      break
    elsif perimeter > 1_500_000
      break
    end
    new_sides_string = new_sides.join
    if lookup_triangles[new_sides_string].nil?
      lookup_triangles[new_sides_string] = {
        sides: new_sides,
        perimeter: perimeter
      }
    end
  end
  count += 1
end

pp lookup_triangles.map{|_,v| v[:perimeter]}.group_by{|p| p}.reject{|_,v| v.count > 1}.count