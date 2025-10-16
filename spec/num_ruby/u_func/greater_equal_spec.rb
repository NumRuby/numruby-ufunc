require 'spec_helper'

RSpec.describe NumRuby::UFunc::GreaterEqual do
  describe '.call' do
    it 'returns correct comparison results' do
      x = Numo::DFloat[3, 5, 1, 7]
      y = Numo::DFloat[2, 5, 2, 6]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles negative numbers correctly' do
      x = Numo::DFloat[-1, -5, 0]
      y = Numo::DFloat[-2, -3, -1]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 2.7, 3.14]
      y = Numo::DFloat[1.4, 2.7, 3.15]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles equal values correctly' do
      x = Numo::DFloat[2.0, 5.5, -1.0]
      y = Numo::DFloat[2.0, 5.5, -1.0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles large numbers' do
      x = Numo::DFloat[1e10, 1e-10]
      y = Numo::DFloat[1e9, 1e-9]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles zero comparisons' do
      x = Numo::DFloat[0.0, -0.0, 0.0]
      y = Numo::DFloat[0.0, 0.0, -0.0]
      result = described_class.call(x, y)
      expected = Numo::Bit.cast([1, 1, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[4, 2, 3]
      y = Numo::DFloat[3, 2, 4]
      result = NumRuby::UFunc::Registry.call(:greater_equal, x, y)
      expected = Numo::Bit.cast([1, 1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end

RSpec.describe 'NumRuby.greater_equal' do
  it 'delegates to GreaterEqual.call' do
    x = Numo::DFloat[4, 2, 6]
    y = Numo::DFloat[3, 2, 7]
    result = NumRuby.greater_equal(x, y)
    expected = Numo::Bit.cast([1, 1, 0])
    expect(result.to_a).to eq(expected.to_a)
  end
end
