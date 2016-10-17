  time_start = Time.now
  iterator_count = 0



  #add 52 cards
  a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52]
  cards = []
  cards = a.shuffle.first(7)
  cards.shuffle!

  puts "cards = #{cards.inspect}"

  #combination at the hands of player
  hands = [cards[0], cards[6]]
  #combination on the table
  table = [cards[1], cards[2], cards[3], cards[4], cards[5]]
  puts "hands = #{hands.inspect}"
  puts "table = #{table.inspect}"

  m1 = cards

  def sorting(massive)
  ret = []
  ret = massive.sort {|x,y| x<=>y}
  return [*ret]
  end

  a1 = sorting(m1)
  puts "a1 = #{a1.inspect}"

  ########################
  # definitions if combinations is present

  #def combinations(a, hands)
    marker_of_win = 0
    #isRoyalFlush
    if marker_of_win != 1
      for i in 0..6 do
        if ((a1[i]%13==0)&&(a1[i-1]==(a1[i]-1))&&(a1[i-2]==(a1[i]-2))&&(a1[i-3]==(a1[i]-3))&&(a1[i-4]==(a1[i]-4)))
           for s in 0..2 do
             if (a1[i]==hands[s]||a1[i+1]==hands[s]||a1[i+2]==hands[s]||a1[i+3]==hands[s]||a1[i+4]==hands[s])
              win_combination = "isRoyalFlush"
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
            win_combination = "isStraightFlush"
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
          win_combination = "isQuads"
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
                win_combination = "isFullHouse"
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
          win_combination = "isStraight"
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
              win_combination = "isFlush"
            end
          end
        end
      end
    end
    #isSet
    if marker_of_win != 1
      for j in 0..4
        if (a1[j] == (a1[j+1]-13)) && ((a1[j+1]) == (a1[j+2]-13))
          win_combination = "isSet"
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
            win_combination = "isTwoPair"
            marker_of_win = 1
        end
      end
    end
    #isOnePair
    if marker_of_win != 1
      for i in 0..5 do
        for k in 1..4 do
          if (a1[i] == (a1[i+1]-13*k))
            win_combination = "isOnePair"
          end
        end
      end
    end
  #combinations(a1, hands)
  puts win_combination

 time_finish = Time.now

 time_for_calculating = time_finish - time_start

  puts time_for_calculating
