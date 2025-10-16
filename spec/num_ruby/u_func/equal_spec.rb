require 'spec_helper'

RSpec.describe NumRuby::UFunc::Equal do
  describe '.call' do
    it 'returns correct equality results' do
      x = Numo::DFloat[1, 5, 3, 7]
      y = Numo::DFloat[2, 5, 3, 6]
      result = described_class.call(x, y)
      expected = Numo::Bit[0, 1, 1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles negative numbers correctly' do
      x = Numo::DFloat[-1, -5, 0]
      y = Numo::DFloat[-1, -3, 0]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles floating point numbers' do
      x = Numo::DFloat[1.5, 2.7, 3.14]
      y = Numo::DFloat[1.5, 2.8, 3.14]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles zero comparisons' do
      x = Numo::DFloat[0.0, -0.0, 0.0]
      y = Numo::DFloat[0.0, 0.0, -0.0]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 1, 1]
      expect(result.to_a).to eq(expected.to_a)
    end

    it 'handles large numbers' do
      x = Numo::DFloat[1e10, 1e-10]
      y = Numo::DFloat[1e10, 1e-11]
      result = described_class.call(x, y)
      expected = Numo::Bit[1, 0]
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'registry' do
    it 'can be called through registry' do
      x = Numo::DFloat[4, 2]
      y = Numo::DFloat[4, 3]
      result = NumRuby::UFunc::Registry.call(:equal, x, y)
      expected = Numo::Bit.cast([1, 0])
      expect(result.to_a).to eq(expected.to_a)
    end
  end

  describe 'NumRuby.equal' do
    it 'delegates to Equal.call' do
      x = Numo::DFloat[4, 2, 6]
      y = Numo::DFloat[4, 3, 6]
      result = NumRuby.equal(x, y)
      expected = Numo::Bit.cast([1, 0, 1])
      expect(result.to_a).to eq(expected.to_a)
    end
  end
end
