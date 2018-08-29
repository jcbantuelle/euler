primes_hash = {}

file = IO.readlines('primes.txt')
file.each do |prime|
  primes_hash[prime.to_i] = true
end

puts "Finished Primes"
require 'pp'

target = 100_000_000

start_time = Time.now
answers = []
2.upto(target) do |i|
  a = i+1
  answers << i if primes_hash[a] && [2,3].include?(a%4)
end
pp answers.count
pp "Found in #{Time.now - start_time} seconds"

start_time = Time.now
answers = answers.reject { |a|
  reject = false
  1.upto(Math.sqrt(a)) { |b|
    if (a % b).zero?
      if !primes_hash[a/b+b] || !primes_hash[a/(a/b)+(a/b)]
        reject = true
        break
      end
    end
  }
  reject
}

pp answers.inject(&:+) + 1
pp "Found in #{Time.now - start_time} seconds"
