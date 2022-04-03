require_relative '../edit-test'

# describe 'attribute_selector' do
#     let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }
#     it "returns the values of the selected attribute" do
#         expect attribute_selector(kamwangi).to eq kamwangi.name
#     end
# end

describe 'recipe_changer' do
  let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }
  before(:each) do
      kamwangi.recipes << [21, 50, 26, 8.5, 20.5]
      kamwangi.recipes << [20, 55, 27, 9, 21.5]
      kamwangi.recipes << [20.5, 52, 26, 8.7, 21]
  end

  it 'displays stored recipes with index' do
    expect(recipe_changer(kamwangi)).to 
  end

end