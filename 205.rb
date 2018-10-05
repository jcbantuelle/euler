require 'pp'

colin_die_rolls = [1,2,3,4,5,6].product([1,2,3,4,5,6])

4.times do
  new_die_rolls = []
  colin_die_rolls.each { |cdr|
    1.upto(6) do |i|
      new_die_rolls << (cdr + [i])
    end
  }
  colin_die_rolls = new_die_rolls
end

colin_possibilities = colin_die_rolls.length

colin_frequencies = {}
colin_die_rolls.each { |cdr|
  die_roll = cdr.inject(:+)
  colin_frequencies[die_roll] = 0 unless colin_frequencies[die_roll]
  colin_frequencies[die_roll] += 1
}

pete_die_rolls = [1,2,3,4].product([1,2,3,4])

7.times do
  new_die_rolls = []
  pete_die_rolls.each { |pdr|
    1.upto(4) do |i|
      new_die_rolls << (pdr + [i])
    end
  }
  pete_die_rolls = new_die_rolls
end

pete_frequencies = {}
pete_die_rolls.each { |pdr|
  die_roll = pdr.inject(:+)
  pete_frequencies[die_roll] = 0 unless pete_frequencies[die_roll]
  pete_frequencies[die_roll] += 1
}

winning_chances = []
9.upto(36) do |i|
  winners = colin_frequencies.select{|c,_| c < i}
  winning_possibilities = winners.values.inject(:+)
  winning_chances += ([winning_possibilities.to_f / colin_possibilities] * pete_frequencies[i])
end

pp (winning_chances.reduce(&:+)/winning_chances.length).round(7)
