require 'spec_helper'

RSpec.describe NumRuby::UFunc::Arcsinh do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, 1, 2, 3] }

    it 'computes arcsinh of array elements correctly' do
      expected = Numo::NMath.asinh(x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative values correctly' do
      x_neg = Numo::DFloat[-3, -2, -1, 0, 1, 2, 3]
      result = described_class.call(x_neg)
      expected = Numo::NMath.asinh(x_neg)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles zero correctly' do
      x_zero = Numo::DFloat[0]
      result = described_class.call(x_zero)
      expect(result[0]).to eq(0.0)
    end

    it 'handles large values correctly' do
      x_large = Numo::DFloat[10, 100, 1000]
      result = described_class.call(x_large)
      expected = Numo::NMath.asinh(x_large)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-10
    end
  end

  describe '.arcsinh' do
    subject(:result) { NumRuby.arcsinh(x) }

    let(:x) { Numo::DFloat[0, 1, 2, 3] }

    it 'computes arcsinh of array elements correctly' do
      expected = Numo::NMath.asinh(x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative values correctly' do
      x_neg = Numo::DFloat[-3, -2, -1, 0, 1, 2, 3]
      result = NumRuby.arcsinh(x_neg)
      expected = Numo::NMath.asinh(x_neg)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
