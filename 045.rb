pentagonal = {}
hexagonal = {}

n = 1
while true
  pentagon = n*(3*n-1)/2
  hexagon = n*(2*n-1)
  pentagonal[pentagon] = true
  hexagonal[hexagon] = true
  
  if n > 285
    triangle = n*(n+1)/2
    if pentagonal.include?(triangle) and hexagonal.include?(triangle)
      puts triangle
      break
    end
  end
  n += 1
end