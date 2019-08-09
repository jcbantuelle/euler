require 'pp'

def decimal_expansion(d)
  a = Math.sqrt(d)
  a = a.floor
  num = 1
  b = a
  h = [0, 1]
  k = [1, 0]
  current_v = 0
  previous_v = 0
  total = 0
  digits = 0

  count = 2
  while digits < 100 do
    h << a * h[count-1] + h[count-2]
    k << a * k[count-1] + k[count-2]
    previous_v = current_v
    current_v = (h[count]/k[count]).floor
    if current_v == previous_v
      total += current_v
      digits += 1
      h[count-1] = (h[count-1] - current_v*k[count-1]) * 10
      h[count] = (h[count] - current_v*k[count]) * 10
    end

    a = (num / (Math.sqrt(d) - b)).floor
    num = ((d - b**2) / num).floor
    b = -(b - num * a)
    count += 1
  end
  total
end

pp (1..100).to_a.inject(0) { |total, i|
  Math.sqrt(i) % 1 == 0 ? total : total + decimal_expansion(i)
}
