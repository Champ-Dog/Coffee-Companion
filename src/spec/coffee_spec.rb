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

    it 'has cupping notes' do
        it 'shows cupping notes' do
            expect(kamwangi.cupping).to eq {:highlight => "none", :minimise=>"none", :tactile=>"none"}
        end

end
