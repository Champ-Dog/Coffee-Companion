require_relative '../modules/coffee'

describe Coffee do
  let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }
  let(:decaf) { Coffee.new('Colombia', 'la serrania') }

  it 'can be instantiated' do
    expect(kamwangi).not_to be_nil
    expect(kamwangi).to be_an_instance_of Coffee
  end

  describe '.origin' do
    it 'returns the origin' do
      expect(kamwangi.origin).to eq 'Kenya'
    end

    it 'capitalizes the origin' do
      expect(kamwangi.origin).to eq 'Kenya'
    end
  end

  describe '.name' do
    it 'returns the name' do
      expect(kamwangi.name).to eq 'Kamwangi'
    end

    it 'capitalizes the name' do
      expect(kamwangi.name).to eq 'Kamwangi'
    end
  end

  it 'has other necessary attributes' do
    expect(kamwangi.highlight).to eq []
    expect(kamwangi.minimise).to eq []
    expect(kamwangi.tactile).to eq []
    expect(kamwangi.recipes).to eq []
  end

  it 'stores member objects' do
    expect(Coffee.list.length).to eq 2
  end

  describe 'Coffee.list' do
    it 'returns array of all Coffee class objects' do
      expect(Coffee.list).to include(kamwangi, decaf)
    end
  end

  describe 'self_destruct' do
    before(:each) do
      kamwangi.self_destruct
    end

    it 'removes object from @@coffees array' do
      expect(Coffee.list).not_to include kamwangi
    end

    it 'does not remove other objects' do
      expect(Coffee.list).to include decaf
    end
  end
end
