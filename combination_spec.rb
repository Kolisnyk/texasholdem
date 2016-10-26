require 'rspec'

require_relative 'combination.rb'

describe 'combination' do
  context 'RoyalFlush' do
    it 'should do RoyalFlush' do
      expect( Combination.royal_flush([1, 14, 48, 49, 50, 51, 52], 0)).to eq(1)
    end
  end

  context 'StraightFlush' do
    it 'should do StraightFlush' do
      expect( Combination.straight_flush([1, 14, 47, 48, 49, 50, 51], 0)).to eq(1)
    end
  end

  context 'Quads' do
    it 'should do Quads' do
      expect( Combination.quads([1, 14, 27, 40, 41, 43, 45], 0)).to eq(1)
    end
  end

  context 'FullHouse' do
    it 'should do FullHouse' do
      expect( Combination.full_house([1, 14, 27, 28, 41, 43, 44], 0)).to eq(1)
    end
  end

  context 'Straight' do
    it 'should do Straight' do
      expect( Combination.straight([1, 15, 29, 43, 44, 50, 51], 0)).to eq(1)
    end
  end

  context 'Flush' do
    it 'should do Flush' do
      expect( Combination.flush([1, 3, 5, 7, 9, 32, 45], 0)).to eq(1)
    end
  end

  context 'Set' do
    it 'should do Set' do
      expect( Combination.set([1, 14, 27, 39, 41, 43, 45], 0)).to eq(1)
    end
  end

   context 'TwoPairs' do
     it 'should do TwoPairs' do
       expect( Combination.two_pair([1, 14, 28, 30, 41, 48, 50], 0)).to eq(1)
     end
   end

   context 'OnePair' do
     it 'should do OnePair' do
       expect( Combination.one_pair([1, 14, 23, 30, 41, 48, 51], 0)).to eq(1)
     end
   end

   context 'NoHighestCard' do
     it 'should do return 0' do
       expect( Combination.highest_card([1, 14, 23, 30, 41, 48, 51], 1)).to eq(1)
     end
   end

end
