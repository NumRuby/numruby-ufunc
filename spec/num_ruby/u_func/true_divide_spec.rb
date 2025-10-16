require 'spec_helper'

RSpec.describe NumRuby::UFunc::TrueDivide do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'divides two arrays correctly' do
      expect(result).to eq(Numo::DFloat[0.25, 0.4, 0.5])
    end

    it 'returns float results for integer inputs' do
      x_int = Numo::Int32[1, 2, 3]
      y_int = Numo::Int32[4, 5, 6]
      result = described_class.call(x_int, y_int)
      expect(result.class).to eq(Numo::DFloat)
      expect(result).to eq(Numo::DFloat[0.25, 0.4, 0.5])
    end
  end

  describe '.true_divide' do
    subject(:result) { NumRuby.true_divide(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'divides two arrays correctly' do
      expect(result).to eq(Numo::DFloat[0.25, 0.4, 0.5])
    end

    it 'returns float results for integer inputs' do
      x_int = Numo::Int32[1, 2, 3]
      y_int = Numo::Int32[4, 5, 6]
      result = NumRuby.true_divide(x_int, y_int)
      expect(result.class).to eq(Numo::DFloat)
      expect(result).to eq(Numo::DFloat[0.25, 0.4, 0.5])
    end
  end
end
