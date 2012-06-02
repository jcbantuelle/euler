def parse_hand(hand)
  new_hand = {}
  new_hand[:cards] = []
  suits = []
  hand.each do |card|
    new_card = {}
    value = card[0]
    value = '10' if value == 'T'
    value = '11' if value == 'J'
    value = '12' if value == 'Q'
    value = '13' if value == 'K'
    value = '14' if value == 'A'
    new_card[:value] = value.to_i
    new_card[:suit] = card[1]
    suits << card[1]
    new_hand[:cards] << new_card
  end
  
  new_hand[:cards].sort! do |card1, card2|
    card1[:value] <=> card2[:value]
  end
  
  new_hand[:flush] = suits.uniq.length == 1
  new_hand[:straight] = ((new_hand[:cards][1][:value] == new_hand[:cards][0][:value] + 1) and (new_hand[:cards][2][:value] == new_hand[:cards][1][:value] + 1) and (new_hand[:cards][3][:value] == new_hand[:cards][2][:value] + 1) and (new_hand[:cards][4][:value] == new_hand[:cards][3][:value] + 1))
  new_hand
end

def royal_flush(hand)
  return hand[:cards][4][:value] if hand[:flush] and hand[:cards][0][:value] == 10 and hand[:cards][1][:value] == 11 and hand[:cards][2][:value] == 12 and hand[:cards][3][:value] == 13 and hand[:cards][4][:value] == 14
  return nil
end

def straight_flush(hand)
  return hand[:cards][4][:value] if hand[:flush] and hand[:straight]
  return nil
end

def four_of_a_kind(hand)
  if hand[:cards][1][:value] == hand[:cards][2][:value] and hand[:cards][2][:value] == hand[:cards][3][:value]
    if hand[:cards][3][:value] == hand[:cards][4][:value]
      return hand[:cards][4][:value]
    elsif hand[:cards][0][:value] == hand[:cards][1][:value]
      return hand[:cards][0][:value]
    end
  end
  return nil
end

def full_house(hand)
  if hand[:cards][0][:value] == hand[:cards][1][:value] and hand[:cards][2][:value] == hand[:cards][3][:value] and hand[:cards][3][:value] == hand[:cards][4][:value]
    return hand[:cards][4][:value]
  elsif hand[:cards][0][:value] == hand[:cards][1][:value] and hand[:cards][1][:value] == hand[:cards][2][:value] and hand[:cards][3][:value] == hand[:cards][4][:value]
    return hand[:cards][0][:value]
  end
  return nil
end

def flush(hand)
  return hand[:cards][4][:value] if hand[:flush]
  return nil
end

def straight(hand)
  return hand[:cards][4][:value] if hand[:straight]
  return nil
end

def three_of_a_kind(hand)
  if hand[:cards][2][:value] == hand[:cards][3][:value] and hand[:cards][3][:value] == hand[:cards][4][:value]
    return hand[:cards][4][:value]
  elsif hand[:cards][1][:value] == hand[:cards][2][:value] and hand[:cards][2][:value] == hand[:cards][3][:value]
    return hand[:cards][3][:value]
  elsif hand[:cards][0][:value] == hand[:cards][1][:value] and hand[:cards][1][:value] == hand[:cards][2][:value]
    return hand[:cards][2][:value]
  end
  return nil
end

def two_pairs(hand)
  high_pair = nil
  low_pair = nil
  if hand[:cards][3][:value] == hand[:cards][4][:value]
    high_pair = hand[:cards][4][:value]
  elsif hand[:cards][2][:value] == hand[:cards][3][:value]
    high_pair = hand[:cards][3][:value]
  end
  if hand[:cards][1][:value] == hand[:cards][2][:value]
    low_pair = hand[:cards][2][:value]
  elsif hand[:cards][0][:value] == hand[:cards][1][:value]
    low_pair = hand[:cards][1][:value]
  end
  
  return nil if high_pair.nil? or low_pair.nil?
  return [high_pair, low_pair]
end

def one_pair(hand)
  if hand[:cards][3][:value] == hand[:cards][4][:value]
    return hand[:cards][4][:value]
  elsif hand[:cards][2][:value] == hand[:cards][3][:value]
    return hand[:cards][3][:value]
  elsif hand[:cards][1][:value] == hand[:cards][2][:value]
    return hand[:cards][2][:value]
  elsif hand[:cards][0][:value] == hand[:cards][1][:value]
    return hand[:cards][1][:value]
  end
  return nil
end

def two_pairs_tie_breaker(hand1, hand2)
  return hand1[0] > hand2[0] unless hand1[0] == hand2[0]
  return hand1[1] > hand2[1] unless hand1[1] == hand2[1]
  return nil
end

def tie_breaker(hand1, hand2)
  return (hand1[:cards][4][:value] > hand2[:cards][4][:value]) unless hand1[:cards][4][:value] == hand2[:cards][4][:value]
  return (hand1[:cards][3][:value] > hand2[:cards][3][:value]) unless hand1[:cards][3][:value] == hand2[:cards][3][:value]
  return (hand1[:cards][2][:value] > hand2[:cards][2][:value]) unless hand1[:cards][2][:value] == hand2[:cards][2][:value]
  return (hand1[:cards][1][:value] > hand2[:cards][1][:value]) unless hand1[:cards][1][:value] == hand2[:cards][1][:value]
  return (hand1[:cards][0][:value] > hand2[:cards][0][:value])
end

wins = 0

ranks = [:royal_flush, :straight_flush, :four_of_a_kind, :full_house, :flush, :straight, :three_of_a_kind, :two_pairs, :one_pair]

file = IO.readlines('poker.txt')
file.each do |game|
  hand1 = parse_hand(game.slice!(0..13).split(' '))
  hand2 = parse_hand(game.split(' '))
  
  winner = false
  
  ranks.each do |rank|
    p1 = self.send(rank, hand1)
    p2 = self.send(rank, hand2)
    if p1 and p2.nil?
      wins += 1
      winner = true
      break
    elsif p2 and p1.nil?
      winner = true
      break
    elsif p1 and p2
      if rank == :two_pairs
        tiebreak = two_pairs_tie_breaker(p1, p2)
        unless tiebreak.nil?
         wins += 1 if tiebreak
         winner = true
         break 
        end
      else
        unless p1 == p2
          wins += 1 if p1 > p2
          winner = true
          break
        end
      end
      wins += 1 if tie_breaker(hand1, hand2)
      winner = true
      break
    end
  end
  
  unless winner
    wins += 1 if tie_breaker(hand1, hand2)
  end
end

puts wins