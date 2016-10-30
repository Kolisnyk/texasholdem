# This class is methods
class Agreement
  # method for the conversion of numbers to cards from hash
  def self.conversion(arr, hash_massive)
    rtrn = ''
    arr.each do |i|
      if hash_massive.key? i
        rtrn = hash_massive[i]
        puts rtrn
      end
    end
  end

  # massive sorting
  def self.sorting(massive)
    massive.sort { |x, y| x <=> y }
  end
end
