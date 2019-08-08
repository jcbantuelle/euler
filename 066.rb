require 'pp'

def valid_equation?(x, y, d)
  x**2 - y**2 * d == 1
end

def fundamental_solution(d)
  a = Math.sqrt(d)
  a = a.floor
  num = 1
  b = a
  h = [0, 1]
  k = [1, 0]

  count = 2
  while count == 2 || !valid_equation?(h.last, k.last, d) do
    h << a * h[count-1] + h[count-2]
    k << a * k[count-1] + k[count-2]

    a = (num / (Math.sqrt(d) - b)).floor
    num = ((d - b**2) / num).floor
    b = -(b - num * a)
    count += 1
  end
  h.last
end

largest = {
  d: 0,
  answer: 0
}

2.upto(1000) do |d|
  next if Math.sqrt(d) % 1 == 0
  answer = fundamental_solution(d)
  if answer > largest[:answer]
    largest = {
      d: d,
      answer: answer
    }
  end
end
pp largest