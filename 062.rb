def cube(n)
  n * n * n
end

n = 1
cubes = {}
next_cube = cube(n)
while true
  sorted_cube = next_cube.to_s.each_char.map(&:to_i).sort.join('')
  cubes[sorted_cube] = [] if cubes[sorted_cube].nil?
  cubes[sorted_cube] << n
  if cubes[sorted_cube].length == 5
    puts cube(cubes[sorted_cube][0])
    break
  end
  n += 1
  next_cube = cube(n)
end