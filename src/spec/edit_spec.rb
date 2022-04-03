require_relative '../edit-test'

describe 'attribute_selector' do
    let(:kamwangi) { Coffee.new('kenya', 'kamwangi') }
    it "returns the values of the selected attribute" do
        expect attribute_selector(kamwangi, name).to eq "Kamwangi"
    end
end