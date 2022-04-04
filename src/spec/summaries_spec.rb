require_relative '../summaries'

describe Summaries do
  let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }

  describe 'summarise_bean' do
    it 'returns values in UPPERCASE' do
      expect(kamwangi.summarise_bean).to include 'KENYA'
    end

    it 'returns the origin and name of a coffee' do
      expect(kamwangi.summarise_bean).to include 'KAMWANGI', 'KENYA'
    end

    it 'displays both in a single line, ordered as origin/name' do
      expect(kamwangi.summarise_bean).to eq 'KENYA KAMWANGI'
    end
  end
end
