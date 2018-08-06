require 'pp'

def build_new_possibilities(so_far, possibility, login)
  if possibility.empty?
    return [so_far + login]
  elsif login.empty?
    return [so_far + possibility]
  elsif possibility[0] == login[0]
    return build_new_possibilities(so_far + possibility[0], possibility[1..-1], login[1..-1])
  else
    use_possibility = build_new_possibilities(so_far + possibility[0], possibility[1..-1], login)
    use_login = build_new_possibilities(so_far + login[0], possibility, login[1..-1])
    return use_possibility + use_login
  end
end

logins = IO.readlines('keylog_79.txt')

possibilities = Array.new()
runs = 50
counter = 1
logins.map(&:strip).each do |login|
  if possibilities.empty?
    possibilities << login
  else
    first = login[0]
    second = login[1]
    third = login[2]

    new_possibilities = Array.new

    possibilities = possibilities.select do |possibility|
      keep = possibility =~ /#{first}.*#{second}.*#{third}/
      new_possibilities += build_new_possibilities('', possibility, login) unless keep
      keep
    end
    possibilities += new_possibilities
    possibilities.uniq!
    min_length = possibilities.map(&:length).min
    possibilities = possibilities.reject{|p| p.length > min_length}
  end
  pp "Finished Run ##{counter} on #{login}, #{50 - counter} Runs Left"
  counter += 1
end

pp possibilities

