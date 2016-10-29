
require_relative 'combination.rb'
# This class is for initiation and output
class Holdem < Combination
  # time when program strted
  time_start = Time.now
  # marker if win combination founded
  marker_of_win = 0
  # massive of win combinations
  win_cards = []

  # massive for fast  calculating
  a = (1..52).to_a
  # massive for conversion to cards' names
  hash_massive = { 1 => '2 heart', 2 => '3 heart', 3 => '4 heart',
                   4 => '5 heart', 5 => '6 heart', 6 => '7 heart',
                   7 => '8 heart', 8 => '9 heart', 9 => '10 heart',
                   10 => 'jack heart', 11 => 'queen heart', 12 => 'king heart',
                   13 => 'ace heart', 14 => '2 diamond', 15 => '3 diamond',
                   16 => '4 diamond', 17 => '5 diamond', 18 => '6 diamond',
                   19 => '7 diamond', 20 => '8 diamond', 21 => '9 diamond',
                   22 => '10 diamond', 23 => 'jack diamond', 24 => 'queen
                    diamond',
                   25 => 'king diamond', 26 => 'ace diamond', 27 => '2 club',
                   28 => '3 club', 29 => '4 club', 30 => '5 club',
                   31 => '6 club', 32 => '7 club', 33 => '8 club',
                   34 => '9 club', 35 => '10 club', 36 => 'jack club',
                   37 => 'queen club', 38 => 'king club', 39 => 'ace club',
                   40 => '2 spade', 41 => '3 spade', 42 => '4 spade',
                   43 => '5 spade', 44 => '6 spade', 45 => '7 spade',
                   46 => '8 spade', 47 => '9 spade', 48 => '10 spade',
                   49 => 'jack spade', 50 => 'queen spade', 51 => 'king spade',
                   52 => 'ace spade' }
  # generate the cards on the table
  cards = a.sample(7)

  # the combination at the hands of the player
  hands = cards[0..1]
  puts 'Cards in your hands is'
  Combination.conversion(hands, hash_massive)
  # the combination on the table
  table = cards[2..7]
  puts 'Cards on the table is'
  Combination.conversion(table, hash_massive)

  # sorting cards
  a1 = sorting(cards)

  # definition name of win combination
  if marker_of_win != 1
    marker_of_win = Combination.royal_flush(a1, marker_of_win)
    puts marker_of_win
    win_combination = 'is RoyalFlush'
  end

  if marker_of_win != 1
    marker_of_win = Combination.straight_flush(a1, marker_of_win)
    win_combination = 'is StraightFlush'
  end

  if marker_of_win != 1
    marker_of_win = Combination.quads(a1, marker_of_win)
    win_combination = 'is Quads'
  end

  if marker_of_win != 1
    marker_of_win = Combination.full_house(a1, marker_of_win)
    win_combination = 'is FullHouse'
  end

  if marker_of_win != 1
    marker_of_win = Combination.straight(a1, marker_of_win)
    win_combination = 'is Straight'
  end

  if marker_of_win != 1
    marker_of_win = Combination.flush(a1, marker_of_win)
    win_combination = 'is Flush'
  end

  if marker_of_win != 1
    marker_of_win = Combination.set(a1, marker_of_win)
    win_combination = 'is Set'
  end

  if marker_of_win != 1
    marker_of_win = Combination.two_pair(a1, marker_of_win)
    win_combination = 'is TwoPairs'
  end

  if marker_of_win != 1
    marker_of_win = Combination.one_pair(a1, marker_of_win)
    win_combination = 'is OnePair'
  end

  if marker_of_win != 1
    win_combination = 'is HighestCard'
  end

  puts 'Win combination ' + win_combination
  # names of win cards
  Combination.conversion(win_cards, hash_massive)

  # time when program will been stopped
  time_finish = Time.now

  # the calculation will take time:
  time_for_calculating = time_finish - time_start
  puts time_for_calculating
end
