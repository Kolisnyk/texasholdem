require 'rspec'

require_relative 'holdem.rb'

describe 'holdem' do
  context 'RoyalFlush' do
    it 'should do RoyalFlush' do
      expect( Holdem.combinations([1, 14, 48, 49, 50, 51, 52], 0)).to eq("is RoyalFlush")
    end
  end

  context 'StraightFlush' do
    it 'should do StraightFlush' do
      expect( Holdem.combinations([1, 14, 47, 48, 49, 50, 51], 0)).to eq("is StraightFlush")
    end
  end

  context 'Quads' do
    it 'should do Quads' do
      expect( Holdem.combinations([1, 14, 27, 40, 41, 43, 45], 0)).to eq("is Quads")
    end
  end

  context 'FullHouse' do
    it 'should do FullHouse' do
      expect( Holdem.combinations([1, 14, 27, 28, 41, 43, 44], 0)).to eq("is FullHouse")
    end
  end

  context 'Straight' do
    it 'should do Straight' do
      expect( Holdem.combinations([1, 15, 29, 43, 44, 50, 51], 0)).to eq("is Straight")
    end
  end

  context 'Flush' do
    it 'should do Flush' do
      expect( Holdem.combinations([1, 3, 5, 7, 9, 32, 45], 0)).to eq("is Flush")
    end
  end

  context 'Set' do
    it 'should do Set' do
      expect( Holdem.combinations([1, 14, 27, 39, 41, 43, 45], 0)).to eq("is Set")
    end
  end

   context 'TwoPairs' do
     it 'should do TwoPairs' do
       expect( Holdem.combinations([1, 14, 28, 30, 41, 48, 50], 0)).to eq("is TwoPairs")
     end
   end

   context 'OnePair' do
     it 'should do OnePair' do
       expect( Holdem.combinations([1, 14, 23, 30, 41, 48, 51], 0)).to eq("is OnePair")
     end
   end

end
