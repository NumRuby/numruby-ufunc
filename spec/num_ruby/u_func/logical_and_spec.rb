require 'spec_helper'

RSpec.describe NumRuby::UFunc::LogicalAnd do
  describe '.call' do
    it 'returns correct logical AND results' do
      x = Numo::DFloat[1, 0, 1, 0]
      y = Numo::DFloat[1, 1, 0, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats non-zero values as true' do
      x = Numo::DFloat[2, -3, 5]
      y = Numo::DFloat[7, 1, -2]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'treats zero as false' do
      x = Numo::DFloat[0, 0, 0]
      y = Numo::DFloat[1, 0, -1]
      result = described_class.call(x, y)
      expected = Numo::Bit[0, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 0.0, -2.7]
      y = Numo::DFloat[3.14, 1.0, 0.0]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed positive and negative values' do
      x = Numo::DFloat[-1, -2, 3]
      y = Numo::DFloat[4, -5, -6]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles very small non-zero values' do
      x = Numo::DFloat[1e-10, 0, 1e-15]
      y = Numo::DFloat[1e-12, 1e-8, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[1, 0]
      y = Numo::DFloat[3, 0]
      result = NumRuby::UFunc::Registry.call(:logical_and, x, y)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end

RSpec.describe 'NumRuby.logical_and' do
  it 'delegates to LogicalAnd.call' do
    x = Numo::DFloat[1, 0, 2]
    y = Numo::DFloat[3, 0, 0]
    result = NumRuby.logical_and(x, y)
    expected = Numo::Bit[1, 0, 0]
    expect(result.to_a).to eq(expected.to_a)
  end
end
