require 'spec_helper'

RSpec.describe NumRuby::UFunc::Isinf do
  describe '.call' do
    it 'returns false for finite numbers' do
      x = Numo::DFloat[1.0, -2.5, 0.0, 100.0]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false for NaN' do
      x = Numo::DFloat[Float::NAN, 1.0, Float::NAN]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns true for positive infinity' do
      x = Numo::DFloat[Float::INFINITY, 1.0, Float::INFINITY]
      result = described_class.call(x)
      expected = Numo::Bit.cast([1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns true for negative infinity' do
      x = Numo::DFloat[-Float::INFINITY, -1.0, -Float::INFINITY]
      result = described_class.call(x)
      expected = Numo::Bit.cast([1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed finite and non-finite values' do
      x = Numo::DFloat[1.0, Float::NAN, Float::INFINITY, -Float::INFINITY, 2.5]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 0, 1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false for very large finite numbers' do
      x = Numo::DFloat[1e10, -1e10, 1e100]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false for very small finite numbers' do
      x = Numo::DFloat[1e-10, -1e-10, 1e-100]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles zero correctly' do
      x = Numo::DFloat[0.0, -0.0]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles both infinities together' do
      x = Numo::DFloat[Float::INFINITY, -Float::INFINITY, Float::INFINITY, -Float::INFINITY]
      result = described_class.call(x)
      expected = Numo::Bit.cast([1, 1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'distinguishes infinity from large finite numbers' do
      x = Numo::DFloat[Float::MAX, Float::INFINITY, -Float::MAX, -Float::INFINITY]
      result = described_class.call(x)
      expected = Numo::Bit.cast([0, 1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1.0, Float::INFINITY]
      result = NumRuby::UFunc::Registry.call(:isinf, x)
      expected = Numo::Bit.cast([0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end

RSpec.describe 'NumRuby.isinf' do
  it 'delegates to Isinf.call' do
    x = Numo::DFloat[1.0, Float::INFINITY, Float::NAN]
    result = NumRuby.isinf(x)
    expected = Numo::Bit.cast([0, 1, 0])
    expect(result.to_a).to eq(expected.to_a)
  end
end
