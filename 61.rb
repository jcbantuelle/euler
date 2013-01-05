def triangle(n)
  n * (n + 1) / 2
end

def square(n)
  n * n
end

def pentagon(n)
  n * (3 * n - 1) / 2
end

def hexagon(n)
  n * (2 * n - 1)
end

def heptagon(n)
  n * (5 * n - 3) / 2
end

def octagon(n)
  n * (3 * n - 2)
end

def prefix(n)
  n.to_s.slice(0, 2)
end

def suffix(n)
  n.to_s.slice(2, 2)
end

def find_range(range)
  
  if range[:numbers].length == 6
    if suffix(range[:next]) == prefix(range[:first])
      puts range[:numbers].inject(:+)
    end
  end
  
  range_suffix = suffix(range[:next])
  
  unless range[:used].include?('triangle')
    unless $triangles[range_suffix].nil?
      $triangles[range_suffix].each do |value|
        new_range = {:used => range[:used] + ['triangle'], :numbers => range[:numbers] + [value], :first => range[:first], :next => value}
        find_range(new_range)
      end
    end
  end
  
  unless range[:used].include?('square')
    unless $squares[range_suffix].nil?
      $squares[range_suffix].each do |value|
        new_range = {:used => range[:used] + ['square'], :numbers => range[:numbers] + [value], :first => range[:first], :next => value}
        find_range(new_range)
      end
    end
  end
  
  unless range[:used].include?('pentagon')
    unless $pentagons[range_suffix].nil?
      $pentagons[range_suffix].each do |value|
        new_range = {:used => range[:used] + ['pentagon'], :numbers => range[:numbers] + [value], :first => range[:first], :next => value}
        find_range(new_range)
      end
    end
  end
  
  unless range[:used].include?('hexagon')
    unless $hexagons[range_suffix].nil?
      $hexagons[range_suffix].each do |value|
        new_range = {:used => range[:used] + ['hexagon'], :numbers => range[:numbers] + [value], :first => range[:first], :next => value}
        find_range(new_range)
      end
    end
  end
  
  unless range[:used].include?('heptagon')
    unless $heptagons[range_suffix].nil?
      $heptagons[range_suffix].each do |value|
        new_range = {:used => range[:used] + ['heptagon'], :numbers => range[:numbers] + [value], :first => range[:first], :next => value}
        find_range(new_range)
      end
    end
  end
end

$triangles = {}
$squares = {}
$pentagons = {}
$hexagons = {}
$heptagons = {}
$octagons = []

n = 1
t = triangle(n)
s = square(n)
p = pentagon(n)
hex = hexagon(n)
hep = heptagon(n)
o = octagon(n)

while t <= 9999 do
  
  if t > 999 && t < 10000
    $triangles[prefix(t)] = [] if $triangles[prefix(t)].nil?
    $triangles[prefix(t)] << t
  end
  
  if s > 999 && s < 10000
    $squares[prefix(s)] = [] if $squares[prefix(s)].nil?
    $squares[prefix(s)] << s 
  end
     
  if p > 999 && p < 10000
    $pentagons[prefix(p)] = [] if $pentagons[prefix(p)].nil?
    $pentagons[prefix(p)] << p
  end
     
  if hex > 999 && hex < 10000
    $hexagons[prefix(hex)] = [] if $hexagons[prefix(hex)].nil?
    $hexagons[prefix(hex)] << hex
  end
     
  if hep > 999 && hep < 10000
    $heptagons[prefix(hep)] = [] if $heptagons[prefix(hep)].nil?
    $heptagons[prefix(hep)] << hep
  end
     
  if o > 999 && o < 10000
    $octagons << o
  end
  
  n += 1
  t = triangle(n)
  s = square(n)
  p = pentagon(n)
  hex = hexagon(n)
  hep = heptagon(n)
  o = octagon(n)
end

$octagons.each do |o|
  range = {:used => [], :numbers => [o], :first => o, :next => o}
  find_range(range)
end