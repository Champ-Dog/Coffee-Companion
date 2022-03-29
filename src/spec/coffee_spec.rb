require './coffee'

describe Coffee do
  it 'contains array to store member objects' do
    expect(Coffee.list.length).to eq 0
  end

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

    it 'capitalizes the origin' do
      expect(kamwangi.name).to eq 'Kamwangi'
    end
  end

  it 'has other necessary attributes' do
    expect(kamwangi.highlight).to eq []
    expect(kamwangi.minimise).to eq []
    expect(kamwangi.tactile).to eq []
    expect(kamwangi.tactile).to eq []
    expect(kamwangi.recipes).to eq []
  end

  it 'stores member objects' do
    expect(Coffee.list.length).to eq 2
  end

  describe Coffee.list do
    it 'returns a list of Coffee class objects' do
      expect(Coffee.list).to include('Kamwangi')
      # expect(Coffee.list).not_to include(!Coffee)
    end
  end

end
