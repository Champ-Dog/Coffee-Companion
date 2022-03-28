require './coffee'

describe Coffee do
  let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }

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

    it 'capitalizes the origin' do
      expect(kamwangi.name).to eq 'Kamwangi'
    end
  end

  describe '.highlight' do
    it 'returns the highlight array' do
      expect(kamwangi.highlight).to eq []
    end
  end

  describe '.minimise' do
    it 'returns the minimise array' do
      expect(kamwangi.minimise).to eq []
    end
  end

  describe '.tactile' do
    it 'returns the tactile array' do
      expect(kamwangi.tactile).to eq []
    end
  end

  describe '.tactile' do
    it 'returns the tactile array' do
      expect(kamwangi.tactile).to eq []
    end
  end

  describe '.recipes' do
    it 'returns the recipes array' do
      expect(kamwangi.recipes).to eq []
    end
  end
end
