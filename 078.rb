require 'pp'

def next_m(m)
  sign1 = (-1)**m*-1
  term1 = m*(3*m-1)/2
  m *= -1
  sign2 = (-1)**m*-1
  term = m*(3*m-1)/2
  [
    {sign: sign1, term: term1},
    {sign: sign2, term: term2}
  ]
end

m = []
1.upto(1000) do |i|
  sign1 = (-1)**i*-1
  term1 = i*(3*i-1)/2
  i *= -1
  sign2 = (-1)**i*-1
  term2 = i*(3*i-1)/2
  m += [
    {sign: sign1, term: term1},
    {sign: sign2, term: term2}
  ]
end

partition_answers = [1]
partition_size = 1
answer = 1
while answer % 1_000_000 != 0
  m_index = 0
  answer = 0
  next_term = m[m_index]
  while next_term[:term] <= partition_size
    answer += (partition_answers[partition_size-next_term[:term]] * next_term[:sign])
    m_index += 1
    next_term = m[m_index]
  end
  partition_answers << answer
  partition_size += 1
end

pp partition_size-1