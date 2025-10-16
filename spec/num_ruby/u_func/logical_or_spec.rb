require 'spec_helper'

RSpec.describe NumRuby::UFunc::LogicalOr do
  describe '.call' do
    it 'returns correct logical OR results' do
      x = Numo::DFloat[1, 0, 1, 0]
      y = Numo::DFloat[1, 1, 0, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats non-zero values as true' do
      x = Numo::DFloat[2, -3, 0]
      y = Numo::DFloat[0, 0, 5]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats zero as false' do
      x = Numo::DFloat[0, 0, 0]
      y = Numo::DFloat[0, 0, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 0.0, -2.7]
      y = Numo::DFloat[0.0, 1.0, 0.0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed positive and negative values' do
      x = Numo::DFloat[-1, 0, 3]
      y = Numo::DFloat[0, -5, -6]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles very small non-zero values' do
      x = Numo::DFloat[1e-10, 0, 0]
      y = Numo::DFloat[0, 1e-8, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'returns true when at least one operand is non-zero' do
      x = Numo::DFloat[1, 0, 0, 2]
      y = Numo::DFloat[0, 3, 0, 4]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles large values correctly' do
      x = Numo::DFloat[1e10, 0, -1e10]
      y = Numo::DFloat[0, 1e-10, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1, 0]
      y = Numo::DFloat[0, 0]
      result = NumRuby::UFunc::Registry.call(:logical_or, x, y)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'NumRuby.logical_or' do
    it 'delegates to LogicalOr.call' do
      x = Numo::DFloat[1, 0, 2]
      y = Numo::DFloat[0, 3, 0]
      result = NumRuby.logical_or(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end
