def triplet(a,b,c)
  return a**2 + b**2 == c**2
end

(1..333).each { |a|
  (a..1000).each { |b|
    (b..1000).each { |c|
      if a+b+c == 1000 and triplet(a,b,c)
        puts a*b*c
        return
      end
    }
  }
}