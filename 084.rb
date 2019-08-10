require 'pp'

squares = [
  {name: 'GO', frequency: 0, action: nil},
  {name: 'A1', frequency: 0, action: nil},
  {name: 'CC1', frequency: 0, action: 'community_chest'},
  {name: 'A2', frequency: 0, action: nil},
  {name: 'T1', frequency: 0, action: nil},
  {name: 'R1', frequency: 0, action: nil},
  {name: 'B1', frequency: 0, action: nil},
  {name: 'CH1', frequency: 0, action: 'chance'},
  {name: 'B2', frequency: 0, action: nil},
  {name: 'B3', frequency: 0, action: nil},
  {name: 'JAIL', frequency: 0, action: nil},
  {name: 'C1', frequency: 0, action: nil},
  {name: 'U1', frequency: 0, action: nil},
  {name: 'C2', frequency: 0, action: nil},
  {name: 'C3', frequency: 0, action: nil},
  {name: 'R2', frequency: 0, action: nil},
  {name: 'D1', frequency: 0, action: nil},
  {name: 'CC2', frequency: 0, action: 'community_chest'},
  {name: 'D2', frequency: 0, action: nil},
  {name: 'D3', frequency: 0, action: nil},
  {name: 'FP', frequency: 0, action: nil},
  {name: 'E1', frequency: 0, action: nil},
  {name: 'CH2', frequency: 0, action: 'chance'},
  {name: 'E2', frequency: 0, action: nil},
  {name: 'E3', frequency: 0, action: nil},
  {name: 'R3', frequency: 0, action: nil},
  {name: 'F1', frequency: 0, action: nil},
  {name: 'F2', frequency: 0, action: nil},
  {name: 'U2', frequency: 0, action: nil},
  {name: 'F3', frequency: 0, action: nil},
  {name: 'G2J', frequency: 0, action: 'jail'},
  {name: 'G1', frequency: 0, action: nil},
  {name: 'G2', frequency: 0, action: nil},
  {name: 'CC3', frequency: 0, action: 'community_chest'},
  {name: 'G3', frequency: 0, action: nil},
  {name: 'R4', frequency: 0, action: nil},
  {name: 'CH3', frequency: 0, action: 'chance'},
  {name: 'H1', frequency: 0, action: nil},
  {name: 'T2', frequency: 0, action: nil},
  {name: 'H2', frequency: 0, action: nil}
]

community_chest = [
  0,
  10,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil,
  nil
].shuffle

chance = [
  0,
  10,
  11,
  24,
  39,
  5,
  'railroad',
  'railroad',
  'utility',
  'back',
  nil,
  nil,
  nil,
  nil,
  nil,
  nil
].shuffle

turns = 1_000_000
square = 0
doubles_count = 0
1.upto(turns) do |i|
  die1 = Random.rand(4)+1
  die2 = Random.rand(4)+1
  if die1 == die2
    doubles_count += 1
  else
    doubles_count = 0
  end
  if doubles_count == 3
    doubles_count = 0
    square = 10
  else
    squares_to_move = die1+die2
    square = square+squares_to_move
    square = square % 40 if square > 39
    square_action = squares[square][:action]
    end_turn = false
    while !end_turn && !square_action.nil?
      if square_action == 'jail'
        square = 10
        # doubles_count = 0
      elsif square_action == 'community_chest'
        card = community_chest.shift
        community_chest.push(card)
        if card.nil?
          end_turn = true
        else
          square = card
        end
      elsif square_action == 'chance'
        card = chance.shift
        chance.push(card)
        if card == 'utility'
          if square == 22
            square = 28
          elsif square == 7 || square == 36
            square = 12
          end
        elsif card == 'railroad'
          if square == 7
            square = 15
          elsif square == 22
            square = 25
          elsif square == 36
            square = 5
          end
        elsif card == 'back'
          square -= 3
        elsif !card.nil?
          square = card
        else
          end_turn = true
        end
      end
      square_action = squares[square][:action]
    end
  end
  squares[square][:frequency] += 1
end

pp squares.sort{|s1, s2| s2[:frequency] <=> s1[:frequency]}.take(3).map{|s| squares.find_index{|i| i[:name] == s[:name]} }.join