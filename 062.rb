n = 1
cubes = {}
while true
  next_cube = n**3
  sorted_cube = next_cube.to_s.each_char.map(&:to_i).sort.join('')
  cubes[sorted_cube] = [] if cubes[sorted_cube].nil?
  cubes[sorted_cube] << n
  if cubes[sorted_cube].length == 5
    puts cubes[sorted_cube][0]**3
    break
  end
  n += 1
end