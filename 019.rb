months = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

sundays = 0
day_of_week = 1

1900.upto(2000) do |year|
  1.upto(12) do |month|
    days = months[month]
    days += 1 if month == 2 and year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
    1.upto(days) do |day|
      sundays += 1 if year != 1900 and day == 1 and day_of_week == 7
      if day_of_week == 7
        day_of_week = 1
      else
        day_of_week += 1
      end
    end
  end
end

puts sundays