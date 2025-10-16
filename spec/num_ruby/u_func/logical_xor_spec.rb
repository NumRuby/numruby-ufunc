require 'spec_helper'

RSpec.describe NumRuby::UFunc::LogicalXor do
  describe '.call' do
    it 'returns correct logical XOR results' do
      x = Numo::DFloat[1, 0, 1, 0]
      y = Numo::DFloat[1, 1, 0, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats non-zero values as true' do
      x = Numo::DFloat[2, -3, 5]
      y = Numo::DFloat[0, 1, -2]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats zero as false' do
      x = Numo::DFloat[0, 0, 0]
      y = Numo::DFloat[0, 1, -1]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 0.0, -2.7]
      y = Numo::DFloat[3.14, 1.0, 0.0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed positive and negative values' do
      x = Numo::DFloat[-1, -2, 3, 0]
      y = Numo::DFloat[4, 0, -6, -7]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles very small non-zero values' do
      x = Numo::DFloat[1e-10, 0, 1e-15]
      y = Numo::DFloat[1e-12, 1e-8, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns true when exactly one operand is non-zero' do
      x = Numo::DFloat[1, 0, 2, 0]
      y = Numo::DFloat[0, 3, 0, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns false when both operands are non-zero' do
      x = Numo::DFloat[1, 5, -2]
      y = Numo::DFloat[3, -7, 9]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles large values correctly' do
      x = Numo::DFloat[1e10, 0, -1e10]
      y = Numo::DFloat[1e9, 1e-10, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1, 0]
      y = Numo::DFloat[0, 0]
      result = NumRuby::UFunc::Registry.call(:logical_xor, x, y)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'NumRuby.logical_xor' do
    it 'delegates to LogicalXor.call' do
      x = Numo::DFloat[1, 0, 2]
      y = Numo::DFloat[3, 0, 0]
      result = NumRuby.logical_xor(x, y)
      expected = Numo::Bit.cast([0, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end
