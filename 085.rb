best = 0
area = 0

m = 1
n = 0

result = 0

while result < 2_000_000
  while result < 2_000_000
    n += 1
    result = m * (m+1) * n * (n+1) / 4
    if result < 2_000_000 && result > best
      best = result
      area = m*n
    end
  end
  m += 1
  n = 1
  result = m * (m+1) * n * (n+1) / 4
  if result < 2_000_000 && result > best
    best = result
    area = m*n
  end
  break if result > 2_000_000
end

puts area
