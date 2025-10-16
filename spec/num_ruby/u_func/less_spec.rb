require 'spec_helper'

RSpec.describe NumRuby::UFunc::Less do
  describe '.call' do
    it 'returns correct comparison results' do
      x = Numo::DFloat[1, 5, 3, 7]
      y = Numo::DFloat[2, 5, 2, 6]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles negative numbers correctly' do
      x = Numo::DFloat[-2, -5, 0]
      y = Numo::DFloat[-1, -3, -1]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.4, 2.8, 3.14]
      y = Numo::DFloat[1.5, 2.7, 3.14]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles equal values correctly' do
      x = Numo::DFloat[2.0, 5.5, -1.0]
      y = Numo::DFloat[2.0, 5.5, -1.0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles large numbers' do
      x = Numo::DFloat[1e9, 1e-11]
      y = Numo::DFloat[1e10, 1e-10]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles zero comparisons' do
      x = Numo::DFloat[0.0, -0.0, -1.0]
      y = Numo::DFloat[0.0, 0.0, 0.0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([0, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles mixed positive and negative values' do
      x = Numo::DFloat[-1, 2, -3, 4]
      y = Numo::DFloat[1, -2, -2, 4]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 0, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[3, 2, 6]
      y = Numo::DFloat[4, 2, 5]
      result = NumRuby::UFunc::Registry.call(:less, x, y)
      expected = Numo::Bit.cast([1, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'NumRuby.less' do
    it 'delegates to Less.call' do
      x = Numo::DFloat[3, 2, 6]
      y = Numo::DFloat[4, 2, 5]
      result = NumRuby.less(x, y)
      expected = Numo::Bit.cast([1, 0, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end
