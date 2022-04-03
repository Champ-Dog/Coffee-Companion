require_relative '../recipes'

describe Recipes do
  let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }

  it 'allows Coffee class objects to store recipes' do
    expect(kamwangi.recipes).to eq []
  end  

  describe 'recipe_values' do
    before(:each) do
      kamwangi.recipes << [21, 50, 26, 8.5, 20.5]
      kamwangi.recipes << [20, 55, 27, 9, 21.5]
    end

    it 'returns all values at index [n] from @recipe arrays' do
      expect(kamwangi.recipe_values(0)).to contain_exactly 21, 20
    end

    it 'sorts values from lowest to highest' do
      expect(kamwangi.recipe_values(0)).to eq [20, 21]
    end
  end

  describe 'recipe_summary' do
    before(:each) do
      kamwangi.recipes << [21, 50, 26, 8.5, 20.5]
      kamwangi.recipes << [20, 55, 27, 9, 21.5]
      kamwangi.recipes << [20.5, 52, 26, 8.7, 21]
    end

    it 'converts recipe values into Strings' do
      expect(kamwangi.recipe_summary[0]).to be_a(String)
    end

    it 'returns one string per recipe parameter' do
      expect(kamwangi.recipe_summary.length).to eq kamwangi.recipes[0].length
    end

    it 'returns the minimum and maximum value for each recipe parameter' do
      expect(kamwangi.recipe_summary[0]).to include '20', '21'
    end

    it 'does not return other values for that parameter' do
      expect(kamwangi.recipe_summary[0]).not_to include '20.5'
    end

    it 'returns a parameter label alongside the min/max values' do
      expect(kamwangi.recipe_summary[1]).to include 'Yield:'
    end
  end
end