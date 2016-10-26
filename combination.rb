class Combination

  ##! methods for use
  #method for the conversion of numbers to cards from hash - работает,написанному верить.
  def self.conversion(arr, hash_massive)
    rtrn = ""
    arr.each do |i|
      if hash_massive.key? i
        rtrn = hash_massive[i]
        puts rtrn
      end
    end
  end

  # massive sorting
  def self.sorting(massive)
    ret = []
    ret = massive.sort {|x,y| x<=>y}
    return [*ret]
  end

  # method for defining if any win combination is present
  def self.combination(a1, marker_of_win)
    #isRoyalFlush
    if marker_of_win != 1
      for i in 0..6 do
        if ((a1[i]%13==0)&&(a1[i-1]==(a1[i]-1))&&(a1[i-2]==(a1[i]-2))&&(a1[i-3]==(a1[i]-3))&&(a1[i-4]==(a1[i]-4)))
           for s in 0..2 do
            win_combination = 'is RoyalFlush'
            marker_of_win = 1
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
            win_combination = 'is StraightFlush'
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
          win_combination = 'is Quads'
          marker_of_win = 1
        end
      end
    end
    #isFullHouse
    if marker_of_win != 1
      for i in 0..6
        #count_three = 1
        for j in i..6
          count_three = 1
          if ((a1[i] == a1[j]-13) || (a1[i] == a1[j]-26) || (a1[i] == a1[j]-39))
            count_three = count_three + 1
            puts count_three
            if (count_three >= 3)
              for k in 0..6
              #count_two = 1
                for l in k..6
                  count_two = 1
                  if ((a1[k] = a1[l]-13) || (a1[k] = a1[l]-26) || (a1[k] = a1[l]-39) && ((k != i) && (l != j)))
                    count_two = count_two + 1
                      puts count_two
                    if (count_two >= 2)
                      win_combination = 'is FullHouse'
                      marker_of_win = 1
                    end
                  end
                end
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
          win_combination = 'is Straight'
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
              win_combination = 'is Flush'
              marker_of_win = 1
            end
          end
        end
      end
    end
    #isSet
    if marker_of_win != 1
      set_count = 0
      a1.each do |i|
        a1.each do |j|
          if i == j-13 || i == j-26 || i = j- 39
            set_count = set_count +1
          end
        end
      end
      if set_count == 3
        win_combination = 'is Set'
        marker_of_win = 1
      end
    end
    #isSet
    if marker_of_win != 1

      for i in 0..6
        for j in 0..6
          for k in 0..6

              if (((a1[i] == (a1[j]-13)) && ((a1[j]) == (a1[k]-13))) )
                win_combination = 'is Set'
                marker_of_win = 1
              end

          end
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
             win_combination = 'is TwoPairs'
             marker_of_win = 1
         end
       end
    end
    #isOnePair
    if marker_of_win != 1
      for i in 0..5 do
        for k in 1..4 do
          if (a1[i] == (a1[i+1]-13*k))
            win_combination = 'is OnePair'
          end
        end
      end
    end
    if marker_of_win != 1
      win_combination = 'is HighestCard'
      marker_of_win = 1
    end
    return win_combination
  end
end
