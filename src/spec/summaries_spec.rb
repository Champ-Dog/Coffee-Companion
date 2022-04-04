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

  describe 'summarise_recipe' do
    it 'returns an array of strings for display/export' do
      expect(kamwangi.summarise_recipe[1]).to be_a(String)
    end

    it 'includes a heading at the start of the array' do
      expect(kamwangi.summarise_recipe[0]). to eq "Recipe Summary:"
    end

    it 'populates the array with the output of recipe_summary' do
      expect(kamwangi.summarise_recipe.length).to eq 6
    end
  end

  describe 'summarise_notes' do
    it 'returns an array of strings for display/export' do
      expect(kamwangi.summarise_notes[1]).to be_a(String)
    end

    it 'returns the stored values of @highlight, @minimise, and @tactile, in seperate arrays' do
      expect(kamwangi.summarise_notes.length).to eq 3
    end

    it 'flattens the stored values of @highlight, @minimise, and @tactile for better display' do
      expect(kamwangi.summarise_notes[1]).not_to be_a(Array)
    end
  end
end
