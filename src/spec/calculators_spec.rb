require_relative '../calculators'

describe Calculators do
  let(:dose) { 21 }
  let(:out) { 55 }
  let(:tds) { 8.56 }
  let(:solids) { 4.73 }

  describe 'self.calculate_solids' do
    it 'returns a float' do
      expect(Calculators.calculate_solids(out, tds)).to be_a(Float) 
    end

    it 'rounds to two decimal places' do
      expect(Calculators.calculate_solids(out, tds).to_s.length).to eq 4
    end

    it 'correctly calculates coffee solids (as compared against Coffee Kaizen calculators)' do
      expect(Calculators.calculate_solids(out, tds)).to eq 4.73
    end
  end

  describe 'self.calculate_extraction' do
    it 'returns a float' do
      expect(Calculators.calculate_extraction(dose, solids)).to be_a(Float) 
    end

    it 'rounds to two decimal places' do
      expect(Calculators.calculate_extraction(dose, solids).to_s.length).to eq 5
    end

    it 'correctly calculates extraction percentage (as compared against Coffee Kaizen calculators)' do
      expect(Calculators.calculate_extraction(dose, solids)).to eq 22.52
    end
  end

  describe 'self.return_extraction' do
    it 'calls above methods to calculate extraction' do
      expect(Calculators.return_extraction(dose, out, tds)).to eq 22.52
    end

    it 'displays an on-screen message showing the extraction' do
      expect { Calculators.return_extraction(dose, out, tds) }.to output("Your extraction is 22.52\n").to_stdout
    end
  end
end
