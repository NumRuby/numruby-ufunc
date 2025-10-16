require 'spec_helper'

RSpec.describe NumRuby::UFunc::Greater do
  describe '.call' do
    it 'returns correct comparison results' do
      x = Numo::DFloat[3, 5, 1, 7]
      y = Numo::DFloat[2, 5, 2, 6]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles negative numbers correctly' do
      x = Numo::DFloat[-1, -5, 0]
      y = Numo::DFloat[-2, -3, -1]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 2.7, 3.14]
      y = Numo::DFloat[1.4, 2.8, 3.14]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles large numbers' do
      x = Numo::DFloat[1e10, 1e-10]
      y = Numo::DFloat[1e9, 1e-9]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[4, 2]
      y = Numo::DFloat[3, 3]
      result = NumRuby::UFunc::Registry.call(:greater, x, y)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'NumRuby.greater' do
    it 'delegates to Greater.call' do
      x = Numo::DFloat[4, 2, 6]
      y = Numo::DFloat[3, 2, 7]
      result = NumRuby.greater(x, y)
      expected = Numo::Bit[1, 0, 0]
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end
