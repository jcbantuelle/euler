lychrel = 0
1.upto(10000) do |i|
  test_lychrel = i
  is_lychrel = true
  1.upto(50) do |iterations|
    test_lychrel = test_lychrel + test_lychrel.to_s.reverse.to_i
    if test_lychrel.to_s == test_lychrel.to_s.reverse
      is_lychrel = false
      break
    end
  end
  lychrel += 1 if is_lychrel
end

puts lychrel