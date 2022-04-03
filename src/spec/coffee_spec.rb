require_relative '../coffee'

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

  describe Coffee.list do
    it 'returns array of all Coffee class objects' do
      expect(Coffee.list).to include(kamwangi, decaf)
    end
  end

  describe 'parameter' do
    before(:each) do
      kamwangi.recipes << [21, 50, 26, 8.5, 20.5]
      kamwangi.recipes << [20, 55, 27, 9, 21.5]
    end

    it 'returns all values at index [n] from @recipe arrays' do
      expect(kamwangi.parameter(0)).to contain_exactly 21, 20
    end

    it 'sorts values from lowest to highest' do
      expect(kamwangi.parameter(0)).to eq [20, 21]
    end
  end

  describe 'summarise_recipe' do
    before(:each) do
      kamwangi.recipes << [21, 50, 26, 8.5, 20.5]
      kamwangi.recipes << [20, 55, 27, 9, 21.5]
      kamwangi.recipes << [20.5, 52, 26, 8.7, 21]
    end

    it 'converts recipe values into Strings' do
      expect(kamwangi.summarise_recipe[0]).to be_a(String)
    end

    it 'returns one string per recipe parameter' do
      expect(kamwangi.summarise_recipe.length).to eq kamwangi.recipes[0].length
    end

    it 'returns the minimum and maximum value for each recipe parameter' do
      expect(kamwangi.summarise_recipe[0]).to include '20', '21'
    end

    it 'does not return other values for that parameter' do
      expect(kamwangi.summarise_recipe[0]).not_to include '20.5'
    end

    it 'returns a parameter label alongside the min/max values' do
      expect(kamwangi.summarise_recipe[1]).to include 'Yield:'
    end
  end

  describe 'summarise_name' do
    it 'returns the origin and name of a coffee' do
      expect(kamwangi.summarise_name).to include 'Kamwangi', 'Kenya'
    end

    it 'displays both in a single line, ordered as origin/name' do
      expect(kamwangi.summarise_name).to eq 'Kenya Kamwangi'
    end
  end

  describe 'self_destruct' do
    before(:each) do
      kamwangi.self_destruct
    end

    it 'removes object from @@coffees array' do
      expect(Coffee.list).not_to include kamwangi
    end
  end

end
