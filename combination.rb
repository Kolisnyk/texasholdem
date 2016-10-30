# This class is methods
class Combination
  # methods for defining if any win combination is present
  def self.royal_flush(a1, _marker_of_win)
    if marker_of_win != 1
      (0..6).each do |i|
        if (a1[i] % 13).zero? && (a1[i - 1] == (a1[i] - 1)) && (a1[i -
        2] == (a1[i] - 2)) && (a1[i - 3] == (a1[i] - 3)) && (a1[i -
        4] == (a1[i] - 4))
          return marker_of_win = 1
        end
      end
    end
  end

  def self.straight_flush(a1, _marker_of_win)
    k = 1
    while k <= 52
      (0..6).each do |j|
        (1..48).each do |i|
            if a1[j * k] == i && a1[j * k + 1] == (i + 1) && a1[j * k +
            2] == (i + 2) && a1[j * k + 3] == (i + 3) && a1[j * k + 4] ==
            (i + 4)
              return 1
            end
        end
      end
    k += 13
    end
  end

  def self.quads(a1, _marker_of_win)
    (0..3).each do |j|
      if (a1[j]) == (a1[j + 1] - 13) && ((a1[j + 1]) == (a1[j + 2] -
       13)) && ((a1[j + 2]) == (a1[j + 3] - 13))
        return 1
      end
    end
  end

  def self.full_house(a1, _marker_of_win)
    (0..4).each do |j|
      if (a1[j] == (a1[j + 1] - 13)) && ((a1[j + 1]) == (a1[j + 2] - 13))
        next unless (0..5).each do |i|
          return 1 if a1[i] == (a1[i + 1] - 13) && i != j
        end
      end
    end
  end

  def self.straight(a1, _marker_of_win)
    temp = []
    temp += a1
    (0..6).each do |i|
      if temp[i] > 13 && temp[i] <= 26
        temp[i] = temp[i] - 13
      elsif temp[i] > 26 && temp[i] <= 39
        temp[i] = temp[i] - 26
      elsif temp[i] > 39 && temp[i] <= 52
        temp[i] = temp[i] - 39
      end
    end
    # sorted massive - it will not been used in future
    temp = temp.sort { |x, y| x <=> y }
    (0..2).each do |i|
      return 1 if (temp[i] == temp[i + 1] - 1) && (temp[i +
        1] == temp[i + 2] - 1) && (temp[i + 2] ==
        temp[i + 3] - 1) && (temp[i + 3] ==
        temp[i + 4] - 1)
    end
  end

  def self.flush(a1, _marker_of_win)
    (1..4).each do |i|
      count = 0
      a1.each do |j|
        if j > (13 * (i - 1)) && j <= (13 * i)
          count += 1
          return 1 if count > 4
        end
      end
    end
  end

  def self.set(a1, _marker_of_win)
    a1.each do |i|
      a1.each do |j|
        a1.each do |k|
          return 1 if i == (j - 13) && j == (k - 13)
        end
      end
    end
  end

  def self.two_pair(a1, _marker_of_win)
    (0..5).each do |i|
      count_of_pairs = 0
      (1..4).each do |k|
        return 1 if a1[i] == (a1[i + 1] - 13 * k)
      end
      return 1 if count_of_pairs >= 1
    end
  end

  def self.one_pair(a1, _marker_of_win)
    (0..5).each do |i|
      (1..4).each do |k|
        return 1 if a1[i] == a1[i + 1] - 13 * k
      end
    end
  end
end
