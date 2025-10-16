require 'spec_helper'

RSpec.describe NumRuby::UFunc::Arctanh do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, 0.5, 0.8, 0.9] }

    it 'computes arctanh of array elements correctly' do
      expected = Numo::NMath.atanh(x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles zero correctly' do
      x_zero = Numo::DFloat[0]
      result = described_class.call(x_zero)
      expect(result[0]).to eq(0.0)
    end

    it 'handles negative values in valid range correctly' do
      x_neg = Numo::DFloat[-0.9, -0.5, -0.1, 0, 0.1, 0.5, 0.9]
      result = described_class.call(x_neg)
      expected = Numo::NMath.atanh(x_neg)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'returns infinity for boundary values' do
      x_boundary = Numo::DFloat[1, -1]
      result = described_class.call(x_boundary)
      expect(result[0]).to eq(Float::INFINITY)
      expect(result[1]).to eq(-Float::INFINITY)
    end

    it 'returns NaN for values outside domain' do
      x_invalid = Numo::DFloat[1.5, -1.5, 2, -2]
      result = described_class.call(x_invalid)
      expect(result[0].nan?).to be true
      expect(result[1].nan?).to be true
      expect(result[2].nan?).to be true
      expect(result[3].nan?).to be true
    end

    it 'is an odd function' do
      x_test = Numo::DFloat[0.3, 0.7, 0.95]
      pos_result = described_class.call(x_test)
      neg_result = described_class.call(-x_test)

      # arctanh(-x) should equal -arctanh(x)
      diff = (neg_result + pos_result).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.arctanh' do
    subject(:result) { NumRuby.arctanh(x) }

    let(:x) { Numo::DFloat[0, 0.5, 0.8, 0.9] }

    it 'computes arctanh of array elements correctly' do
      expected = Numo::NMath.atanh(x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles zero correctly' do
      x_zero = Numo::DFloat[0]
      result = NumRuby.arctanh(x_zero)
      expect(result[0]).to eq(0.0)
    end

    it 'returns infinity for boundary values' do
      x_boundary = Numo::DFloat[1, -1]
      result = NumRuby.arctanh(x_boundary)
      expect(result[0]).to eq(Float::INFINITY)
      expect(result[1]).to eq(-Float::INFINITY)
    end

    it 'returns NaN for values outside domain' do
      x_invalid = Numo::DFloat[1.5, -1.5, 2, -2]
      result = NumRuby.arctanh(x_invalid)
      expect(result[0].nan?).to be true
      expect(result[1].nan?).to be true
      expect(result[2].nan?).to be true
      expect(result[3].nan?).to be true
    end
  end
end
