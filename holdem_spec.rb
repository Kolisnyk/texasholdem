require 'rspec'

require_relative 'holdem.rb'

describe 'holdem' do |

  it 'should do  Quads' do
    a  = [2, 17, 27, 40]
    b = [1,14]
    expect (Holdem.combinations(a, b, 1)).to eq'is Quads'
  end
end
