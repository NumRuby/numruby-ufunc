require 'spec_helper'

RSpec.describe NumRuby::UFunc::Conj do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, -2, 3] }

    it 'returns conjugate of array elements correctly' do
      expect(result).to eq(Numo::DFloat[1, -2, 3])
    end

    it 'handles real arrays as identity operation' do
      real_array = Numo::DFloat[1.5, -2.3, 0, 4.7]
      result = described_class.call(real_array)
      expect(result).to eq(real_array)
    end

    it 'preserves array shape' do
      matrix = Numo::DFloat[[1, 2], [3, 4]]
      result = described_class.call(matrix)
      expect(result.shape).to eq(matrix.shape)
      expect(result).to eq(matrix)
    end
  end

  describe '.conj' do
    subject(:result) { NumRuby.conj(x) }

    let(:x) { Numo::DFloat[1, -2, 3] }

    it 'returns conjugate of array elements correctly' do
      expect(result).to eq(Numo::DFloat[1, -2, 3])
    end

    it 'handles real arrays as identity operation' do
      real_array = Numo::DFloat[1.5, -2.3, 0, 4.7]
      result = NumRuby.conj(real_array)
      expect(result).to eq(real_array)
    end
  end
end
