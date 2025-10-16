require 'spec_helper'

RSpec.describe NumRuby::UFunc::LogicalNot do
  describe '.call' do
    it 'returns correct logical NOT results' do
      x = Numo::DFloat[1, 0, 2, 0]
      result = described_class.call(x)
      expected = Numo::Bit[0, 1, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats non-zero values as true, returns false' do
      x = Numo::DFloat[5, -3, 100, 0.1]
      result = described_class.call(x)
      expected = Numo::Bit[0, 0, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats zero as false, returns true' do
      x = Numo::DFloat[0, 0.0, 0]
      result = described_class.call(x)
      expected = Numo::Bit[1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 0.0, -2.7, 0]
      result = described_class.call(x)
      expected = Numo::Bit[0, 1, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles negative values as true' do
      x = Numo::DFloat[-1, -2.5, -0.001]
      result = described_class.call(x)
      expected = Numo::Bit[0, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles very small non-zero values as true' do
      x = Numo::DFloat[1e-10, 1e-15, -1e-12]
      result = described_class.call(x)
      expected = Numo::Bit[0, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed zero and non-zero values' do
      x = Numo::DFloat[0, 1, 0, -1, 0, 2.5]
      result = described_class.call(x)
      expected = Numo::Bit[1, 0, 1, 0, 1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1, 0]
      result = NumRuby::UFunc::Registry.call(:logical_not, x)
      expected = Numo::Bit.cast([0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'NumRuby.logical_not' do
    it 'delegates to LogicalNot.call' do
      x = Numo::DFloat[1, 0, 3]
      result = NumRuby.logical_not(x)
      expected = Numo::Bit.cast([0, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end
