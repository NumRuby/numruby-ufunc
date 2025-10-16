require 'spec_helper'

RSpec.describe NumRuby::UFunc::Fmin do
  describe '.call' do
    it 'returns elementwise minimum ignoring NaNs' do
      x = Numo::DFloat[1, 4, 3]
      y = Numo::DFloat[2, 2, 5]
      result = described_class.call(x, y)
      expected = Numo::DFloat[1, 2, 3]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'ignores NaN in first array' do
      x = Numo::DFloat[Float::NAN, Float::NAN, 3]
      y = Numo::DFloat[2, 5, 1]
      result = described_class.call(x, y)
      expected = Numo::DFloat[2, 5, 1]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'ignores NaN in second array' do
      x = Numo::DFloat[1, 4, 3]
      y = Numo::DFloat[Float::NAN, Float::NAN, 5]
      result = described_class.call(x, y)
      expected = Numo::DFloat[1, 4, 3]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'returns NaN when both values are NaN' do
      x = Numo::DFloat[Float::NAN, 2]
      y = Numo::DFloat[Float::NAN, 3]
      result = described_class.call(x, y)
      expect(result[0].nan?).to be true
      expect(result[1]).to eq(2)
    end

    it 'handles negative numbers correctly' do
      x = Numo::DFloat[-1, Float::NAN, -5]
      y = Numo::DFloat[-2, -3, Float::NAN]
      result = described_class.call(x, y)
      expected = Numo::DFloat[-2, -3, -5]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles infinity correctly' do
      x = Numo::DFloat[Float::INFINITY, -Float::INFINITY, Float::NAN]
      y = Numo::DFloat[1, Float::NAN, -Float::INFINITY]
      result = described_class.call(x, y)
      expect(result[0]).to eq(1)
      expect(result[1]).to eq(-Float::INFINITY)
      expect(result[2]).to eq(-Float::INFINITY)
    end

    it 'handles zero correctly' do
      x = Numo::DFloat[0.0, -0.0, Float::NAN]
      y = Numo::DFloat[-0.0, 0.0, 0.0]
      result = described_class.call(x, y)
      expect(result[0]).to eq(-0.0)
      expect(result[1]).to eq(-0.0)
      expect(result[2]).to eq(0.0)
    end

    it 'handles mixed finite and infinite values' do
      x = Numo::DFloat[1e10, Float::NAN, -1e10]
      y = Numo::DFloat[-Float::INFINITY, 2e10, Float::NAN]
      result = described_class.call(x, y)
      expect(result[0]).to eq(-Float::INFINITY)
      expect(result[1]).to eq(2e10)
      expect(result[2]).to eq(-1e10)
    end

    it 'prefers smaller finite values over infinity' do
      x = Numo::DFloat[Float::INFINITY, -Float::INFINITY, 100]
      y = Numo::DFloat[50, 200, Float::INFINITY]
      result = described_class.call(x, y)
      expected = Numo::DFloat[50, -Float::INFINITY, 100]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles very small numbers correctly' do
      x = Numo::DFloat[1e-10, Float::NAN, -1e-15]
      y = Numo::DFloat[1e-15, -1e-10, Float::NAN]
      result = described_class.call(x, y)
      expected = Numo::DFloat[1e-15, -1e-10, -1e-15]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-15
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1, Float::NAN]
      y = Numo::DFloat[2, 2]
      result = NumRuby::UFunc::Registry.call(:fmin, x, y)
      expected = Numo::DFloat[1, 2]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end

RSpec.describe 'NumRuby.fmin' do
  it 'delegates to Fmin.call' do
    x = Numo::DFloat[3, Float::NAN, 1]
    y = Numo::DFloat[2, 2, Float::NAN]
    result = NumRuby.fmin(x, y)
    expected = Numo::DFloat[2, 2, 1]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
