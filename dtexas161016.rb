
  #time when program strted
  time_start = Time.now
  #nember of iterations for looking for combination
  iterator_count = 0
  #name of win combination
  win_combination = ""
  #marker if win combination founded
  marker_of_win = 0
  #massive of win combinations
  win_cards = []

  #massive for fast  calculating
  a = (1..52).to_a
  #massive for conversion to cards' names
  hash_massive = {1 => "2 heart", 2 => "3 heart", 3 => "4 heart", 4 => "5 heart", 5 => "6 heart", 6 => "7 heart", 7 => "8 heart", 8 => "9 heart", 9 => "10 heart", 10 => "jack heart", 11 => "queen heart", 12 => "king heart", 13 => "ace heart", 14 => "2 diamond", 15 => "3 diamond", 16 => "4 diamond", 17 => "5 diamond", 18 => "6 diamond", 19 => "7 diamond", 20 => "8 diamond", 21 => "9 diamond", 22 => "10 diamond", 23 => "jack diamond", 24 => "queen diamond", 25 => "king diamond", 26 => "ace diamond", 27 => "2 club", 28 => "3 club", 29 => "4 club", 30 => "5 club", 31 => "6 club", 32 => "7 club", 33 => "8 club", 34 => "9 club", 35 => "10 club", 36 => "jack club", 37 => "queen club", 38 => "king club", 39 => "ace club", 40 => "2 spade", 41 => "3 spade", 42 => "4 spade", 43 => "5 spade", 44 => "6 spade", 45 => "7 spade", 46 => "8 spade", 47 => "9 spade", 48 => "10 spade", 49 => "jack spade", 50 => "queen spade", 51 => "king spade", 52 => "ace spade"}
  #generate the cards on the table
  cards = a.shuffle.first(7)

  ##! methods for use
  #method for the conversion of numbers to cards from hash - работает,написанному верить.
  def conversion(arr, hash_massive)
    rtrn = ""
    arr.each do |i|
      if hash_massive.key? i
        rtrn = hash_massive[i]
        puts rtrn
      end
    end
  end

  # massive sorting
  def sorting(massive)
    ret = []
    ret = massive.sort {|x,y| x<=>y}
    return [*ret]
  end

  # method for defining if any win combination is present
  def combinations(a1, hands, marker_of_win)
    #isRoyalFlush
    if marker_of_win != 1
      for i in 0..6 do
        if ((a1[i]%13==0)&&(a1[i-1]==(a1[i]-1))&&(a1[i-2]==(a1[i]-2))&&(a1[i-3]==(a1[i]-3))&&(a1[i-4]==(a1[i]-4)))
           for s in 0..2 do
             if (a1[i]==hands[s]||a1[i+1]==hands[s]||a1[i+2]==hands[s]||a1[i+3]==hands[s]||a1[i+4]==hands[s])
              win_combination = "is RoyalFlush"
              marker_of_win = 1
            end
          end
        end
      end
    end
    #isStraightFlush
    if marker_of_win != 1
      k = 1
      while k <= 52 do
        for j in 0..6 do
          for i in 1..48  do
            if (a1[j*k]==i && a1[j*k+1]==(i+1) && a1[j*k+2]==(i+2) && a1[j*k+3]==(i+3) && a1[j*k+4]==(i+4))
            win_combination = "is StraightFlush"
            marker_of_win = 1
            end
          end
        end
      k=k+13
      end
    end
    #isQuads
    if marker_of_win != 1
      for j in 0..3
        if ((a1[j])==(a1[j+1]-13)&&((a1[j+1])==(a1[j+2]-13)) && ((a1[j+2]) == (a1[j+3]-13)))
          win_combination = "is Quads"
          marker_of_win = 1
        end
      end
    end
    #isFullHouse
    if marker_of_win != 1
      for j in 0..4
        if (a1[j] == (a1[j+1]-13)) && ((a1[j+1]) == (a1[j+2]-13))
          for i in 0..5
            if (a1[i] == (a1[i+1]-13))
              if (i!=j)
                win_combination = "is FullHouse"
                marker_of_win = 1
              end
            end
          end
        end
      end
    end
    #isStraight
    if marker_of_win != 1
      temp = []
      temp = temp + a1
      for i in 0..6
        if (temp[i] > 13 && temp[i] <= 26)
          temp[i] = temp[i]-13
        elsif (temp[i] >26 && temp[i] <= 39)
          temp[i] = temp[i]-26
        elsif (temp[i] > 39 && temp[i] <= 52)
          temp[i] = temp[i]-39
        end
      end
      #sorted massive - it will not been used in future
      temp = temp.sort {|x,y| x<=>y}
      for i in 0..2
        if (temp[i] == temp[i+1]-1) && (temp[i+1] == temp[i+2]-1) && (temp[i+2] == temp[i+3]-1) && (temp[i+3] == temp[i+4]-1)
          win_combination = "is Straight"
          marker_of_win = 1
        end
      end
    end
    #isFlush
    if marker_of_win != 1
      for i in 1..4
        count = 0
        for j in 0..6
          if (a1[j]>(13*(i-1)) && a1[j]<=(13*i))
            count = count+1
            if count > 4
              win_combination = "is Flush"
              marker_of_win = 1
            end
          end
        end
      end
    end
    #isSet
    if marker_of_win != 1
      for j in 0..4
        if (a1[j] == (a1[j+1]-13)) && ((a1[j+1]) == (a1[j+2]-13))
          win_combination = "is Set"
          marker_of_win = 1
        end
      end
    end
    #isTwoPair
    if marker_of_win != 1
      for i in 0..5 do
        count_of_pairs = 0
        for k in 1..4 do
          if (a1[i] == (a1[i+1]-13*k))
            count_of_pairs = count_of_pairs + 1
          end
        end
        if count_of_pairs >= 1
            win_combination = "is TwoPairs"
            marker_of_win = 1
        end
      end
    end
    #isOnePair
    if marker_of_win != 1
      for i in 0..5 do
        for k in 1..4 do
          if (a1[i] == (a1[i+1]-13*k))
            win_combination = "is OnePair"
          end
        end
      end
    end
    if marker_of_win != 1
      win_combination = "is HighestCard"
      marker_of_win = 1
    end
    return win_combination
  end


  #the combination at the hands of the player
  hands = cards[0..2]
  puts "Cards in your hands is"
  conversion(hands, hash_massive)
  #the combination on the table
  table = cards[2..7]
  puts "Cards on the table is"
  conversion(table, hash_massive)

  #sorting cards
  a1 = sorting(cards)

  #definition nameofwincombination
  win_combination = combinations(a1, hands, marker_of_win)
  puts "Win combination " + win_combination

  #names of win cards
  conversion(win_cards, hash_massive)

  #time when program will been stopped
  time_finish = Time.now

  #the calculation will take time:
  time_for_calculating = time_finish - time_start
  puts time_for_calculating
