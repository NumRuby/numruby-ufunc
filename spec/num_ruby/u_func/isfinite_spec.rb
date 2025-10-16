require 'spec_helper'

RSpec.describe NumRuby::UFunc::Isfinite do
  describe '.call' do
    it 'returns true for finite numbers' do
      x = Numo::DFloat[1.0, -2.5, 0.0, 100.0]
      result = described_class.call(x)
      expected = Numo::Bit[1, 1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false for NaN' do
      x = Numo::DFloat[Float::NAN, 1.0, Float::NAN]
      result = described_class.call(x)
      expected = Numo::Bit[0, 1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false for positive infinity' do
      x = Numo::DFloat[Float::INFINITY, 1.0, Float::INFINITY]
      result = described_class.call(x)
      expected = Numo::Bit[0, 1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false for negative infinity' do
      x = Numo::DFloat[-Float::INFINITY, -1.0, -Float::INFINITY]
      result = described_class.call(x)
      expected = Numo::Bit[0, 1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed finite and non-finite values' do
      x = Numo::DFloat[1.0, Float::NAN, Float::INFINITY, -Float::INFINITY, 2.5]
      result = described_class.call(x)
      expected = Numo::Bit[1, 0, 0, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns true for very large finite numbers' do
      x = Numo::DFloat[1e10, -1e10, 1e100]
      result = described_class.call(x)
      expected = Numo::Bit[1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns true for very small finite numbers' do
      x = Numo::DFloat[1e-10, -1e-10, 1e-100]
      result = described_class.call(x)
      expected = Numo::Bit[1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles zero correctly' do
      x = Numo::DFloat[0.0, -0.0]
      result = described_class.call(x)
      expected = Numo::Bit[1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1.0, Float::NAN]
      result = NumRuby::UFunc::Registry.call(:isfinite, x)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end

RSpec.describe 'NumRuby.isfinite' do
  it 'delegates to Isfinite.call' do
    x = Numo::DFloat[1.0, Float::NAN, Float::INFINITY]
    result = NumRuby.isfinite(x)
    expected = Numo::Bit[1, 0, 0]
    expect(result.to_a).to eq(expected.to_a)
  end
end
