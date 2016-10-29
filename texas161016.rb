

  time_start = Time.now
  iterator_count = 0
  marker_of_win = false
  win_combination = ""


a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52]
  cards = []
  cards = a.shuffle.first(7)
  cards.shuffle!

  puts "cards = #{cards.inspect}"

  #checking for win combinations
  hands = [cards[0], cards[1]]
  table = [cards[2], cards[3], cards[4], cards[5], cards[6]]
  puts "hands = #{hands.inspect}"
  puts "table = #{table.inspect}"

  # sorting of massive
  sorted = cards.sort {|x,y| x<=>y}

  # test combination
  sorted = [1, 14, 27, 2, 3, 4, 5]
  #cheking for won combination - isRoyalFlush
  def royal_flush
    for i in 1..4  do
      for j in 1..4  do
        if (sorted.include?(i*13) && sorted.include?(i*13-1) && sorted.include?(i*13-2) && sorted.include?(i*13-3) && sorted.include?(i*13-4))
          win_combination = "isRoyalFlush"
          if win_combination == "isRoyalFlush"
            marker_of_win = true
          end
        end
      end
    end
  end

  #cheking for won combination - isStraightFlush
 #  k = 1
 #  while k <= 52	do
 #    for j in 0..7 do
 #      for i in 1..48  do
 #        if (sorted[j*k]==i && sorted[j*k+1]==(i+1) && sorted[j*k+2]==(i+2) && sorted[j*k+3]==(i+3) && sorted[j*k+4]==(i+4))
 #          win_combination = "isStraightFlush"
 #        end
 #      end
 #    end
 #  k=k+13
 #  end

 #  #cheking for won combination - isQuads
 #    for j in 0..12
 #      if (sorted[j] == (sorted[13+j])) && ((sorted[j + 13]) == (sorted[j+26])) && ((sorted[j + 26]) == (sorted[j+39]))
 #        win_combination = "isQuads"
 #      end
 #    end


 # # cheking for won combination - isFullHouse
 #    for j in 0..12
 #     if (sorted[j] == (sorted[j+13]) && ((sorted[j+13]) == (sorted[j+26]))
 #       for j in 1..13
 #         if (sorted[j] == (sorted[j*2]-13))
 #           win_combination = "isFullHouse"
 #          end
 #        end
 #      end
 #    end


 #  #cheking for won combination - isStraight

 #    for i in 0..6
 #      if (sorted[i] >=13 && sorted[i] < 26)
 #        sorted[i] = sorted[i]-13
 #      elsif (sorted[i] >=26 && sorted[i] < 39)
 #        sorted[i] = sorted[i]-26
 #      elsif (sorted[i] >=39 && sorted[i] < 53)
 #        sorted[i] = sorted[i]-39
 #      end
 #    end
 #    #look for sorted will not been used in future
 #      sorted = sorted.sort {|x,y| x<=>y}
 #    for i in 0..2
 #      if (sorted[i] = sorted[i+1]-1) && (sorted[i+1] = sorted[i+2]-1) && (sorted[i+2] = sorted[i+3]-1) && (sorted[i+3] = sorted[i+4]-1) && (sorted[i+4] = sorted[i+5]-1)
 #        win_combination = "isStraight"
 #      end
 #    end

 #  #cheking for won combination - isFlush
 #     for i in 1..4
 #       count = 0
 #       for j in 0..6
 #         if (sorted[j]<13*i)
 #         count = count+1
 #         end
 #         if count > 4
 #           win_combination = "isFlush"
 #         end
 #       end
 #     end

 #  #cheking for won combination - isSet
 #   count_number_of_cards = 0
 #   for i in 0..6
 #    for j in 0..4
 #      for k in 0..6
 #        if ((sorted[i] == sorted[k]-13*j) && i!=k)
 #          count_number_of_cards = count_number_of_cards +1
 #        end
 #      end
 #     end
 #   end
 #   if count_number_of_cards >= 3
 #     win_combination = "isSet"
 #   end

 #  #cheking for won combination - isTwoPair - working
 #  count_number_of_pairs = 0
 #  for i in 0..12
 #   for j in 1..3
 #      if (sorted[i*j] == sorted[i*(j+1)])
 #        count_number_of_pairs = count_number_of_pairs +1
 #      end
 #    end
 #  end
 #  if count_number_of_pairs >= 1
 #    win_combination = "isTwoPair"
 #  end


 #  #cheking for won combination - isOnePair - working
 #  for i in 0..12
 #    for j in 1..3
 #      if (sorted[i*j] == sorted[i*(j+1)])
 #        win_combination = "isOnePair"
 #      end
 #    end
 #  end


 #  puts win_combination

 # time_finish = Time.now

 # time_for_calculating = time_finish - time_start

 #  puts time_for_calculating


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
         # elsif
         #  for k in 0..2 do
         #    ((a1[i]%13==0)&&(a1[i-6+k]==(a1[i]-12))&&(a1[i-5+k]==(a1[i]-11))&&(a1[i-4+k]==(a1[i]-10))&&(a1[i-3+k]==(a1[i]-9)))
         #    for s in 0..2 do
         #      if (a1[i]==hands[s]||a1[i-1]==hands[s]||a1[i-2]==hands[s]||a1[i-3]==hands[s]||a1[i-4]==hands[s])
         #        win_combination = "isRoyalFlush"
         #        marker_of_win = 1
         #      end
         #    end
         #  end
        end
      end
    end
