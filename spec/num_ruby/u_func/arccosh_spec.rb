require 'spec_helper'

RSpec.describe NumRuby::UFunc::Arccosh do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, 2, 3, 4] }

    it 'computes arccosh of array elements correctly' do
      expected = Numo::NMath.acosh(x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles edge case at x=1 correctly' do
      x_one = Numo::DFloat[1]
      result = described_class.call(x_one)
      expect(result[0]).to eq(0.0)
    end

    it 'returns NaN for values less than 1' do
      x_invalid = Numo::DFloat[0.5, 0, -1]
      result = described_class.call(x_invalid)
      expect(result[0].nan?).to be true
      expect(result[1].nan?).to be true
      expect(result[2].nan?).to be true
    end

    it 'handles large values correctly' do
      x_large = Numo::DFloat[10, 100, 1000]
      result = described_class.call(x_large)
      expected = Numo::NMath.acosh(x_large)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-10
    end

    it 'is monotonically increasing for valid domain' do
      x_increasing = Numo::DFloat[1, 1.5, 2, 3, 5]
      result = described_class.call(x_increasing)

      # Check that result is increasing
      (1...result.size).each do |i|
        expect(result[i]).to be > result[i - 1]
      end
    end
  end

  describe '.arccosh' do
    subject(:result) { NumRuby.arccosh(x) }

    let(:x) { Numo::DFloat[1, 2, 3, 4] }

    it 'computes arccosh of array elements correctly' do
      expected = Numo::NMath.acosh(x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles edge case at x=1 correctly' do
      x_one = Numo::DFloat[1]
      result = NumRuby.arccosh(x_one)
      expect(result[0]).to eq(0.0)
    end

    it 'returns NaN for values less than 1' do
      x_invalid = Numo::DFloat[0.5, 0, -1]
      result = NumRuby.arccosh(x_invalid)
      expect(result[0].nan?).to be true
      expect(result[1].nan?).to be true
      expect(result[2].nan?).to be true
    end
  end
end
