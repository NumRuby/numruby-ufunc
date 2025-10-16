require 'spec_helper'

RSpec.describe NumRuby::UFunc::Heaviside do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[-1, 0, 1] }
    let(:y) { Numo::DFloat[0.5, 0.5, 0.5] }

    it 'computes heaviside step function correctly' do
      expect(result).to eq(Numo::DFloat[0.0, 0.5, 1.0])
    end

    it 'returns 0 for negative values' do
      x_neg = Numo::DFloat[-2, -1, -0.5]
      y_val = Numo::DFloat[0.3, 0.7, 0.9]
      result = described_class.call(x_neg, y_val)
      expect(result).to eq(Numo::DFloat[0.0, 0.0, 0.0])
    end

    it 'returns 1 for positive values' do
      x_pos = Numo::DFloat[0.5, 1, 2]
      y_val = Numo::DFloat[0.3, 0.7, 0.9]
      result = described_class.call(x_pos, y_val)
      expect(result).to eq(Numo::DFloat[1.0, 1.0, 1.0])
    end

    it 'returns y values for zero inputs' do
      x_zero = Numo::DFloat[0, 0, 0]
      y_val = Numo::DFloat[0.2, 0.8, 1.5]
      result = described_class.call(x_zero, y_val)
      expect(result).to eq(Numo::DFloat[0.2, 0.8, 1.5])
    end
  end

  describe '.heaviside' do
    subject(:result) { NumRuby.heaviside(x, y) }

    let(:x) { Numo::DFloat[-1, 0, 1] }
    let(:y) { Numo::DFloat[0.5, 0.5, 0.5] }

    it 'computes heaviside step function correctly' do
      expect(result).to eq(Numo::DFloat[0.0, 0.5, 1.0])
    end
  end
end
