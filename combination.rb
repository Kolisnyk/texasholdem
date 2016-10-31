# This class is methods
class Combination
  # methods for defining if any win combination is present
  def self.royal_flush(a1, _marker_of_win)
    (0..6).each do |i|
      return 1 if (a1[i] % 13).zero? && sequence?(a1, i)
    end
  end

  def self.sequence?(a1, i)
    (1..4).each do |j|
      return false unless a1[i - j] == (a1[i] - j)
    end
    true
  end

  def self.straight_flush(a1, _marker_of_win)
    k = 1
    while k <= 52
      (0..6).each do |j|
        return 1 if sequence_straight_flush?(a1, j, k)
      end
      k += 13
    end
  end

  def self.sequence_straight_flush?(a1, j, k)
    (1..48).each do |i|
      (0..4).each do |n|
        return false if a1[j * k] == i + n
      end
    end
    true
  end

  def self.quads(a1, _marker_of_win)
    (0..3).each do |j|
      return 1 if sequence_quads?(a1, j)
    end
  end

  def self.sequence_quads?(a1, j)
    (0..2).each do |i|
      return false unless a1[j + i] == (a1[j + i + 1] - 13)
    end
    true
  end

  def self.full_house(a1, _marker_of_win)
    (0..4).each do |j|
      next unless (a1[j] == (a1[j + 1] - 13)) && ((a1[j + 1]) ==
       (a1[j + 2] - 13))
      (0..5).each do |i|
        return 1 if sequence_full_house?(a1, j, i)
      end
    end
  end

  def self.sequence_full_house?(a1, j, i)
    return false unless a1[j + i] == (a1[j + i + 1] - 13)
    true
  end

  def self.straight(a1, _marker_of_win)
    temp = []
    temp += a1
    sequence_temp(temp)
    temp = temp.sort { |x, y| x <=> y }
    (0..2).each do |i|
      (0..4).each do |j|
        return 1 if temp[i + j] == (temp[i + j + 1] - 1)
      end
    end
  end

  def self.sequence_temp(temp)
    (0..6).each do |i|
      if (14..26).cover?(temp[i])
        temp[i] = temp[i] - 13
      elsif (27..39).cover?(temp[i])
        temp[i] = temp[i] - 26
      elsif (40..52).cover?(temp[i])
        temp[i] = temp[i] - 39
      end
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
