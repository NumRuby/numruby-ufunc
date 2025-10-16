require 'spec_helper'

RSpec.describe NumRuby::UFunc::Invert do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::Int32[5, 7, 15] }

    it 'performs bitwise NOT operation correctly' do
      expect(result).to eq(Numo::Int32[-6, -8, -16])
    end

    it 'handles zero correctly' do
      x_zero = Numo::Int32[0]
      result = described_class.call(x_zero)
      expect(result).to eq(Numo::Int32[-1])
    end

    it 'handles negative one correctly' do
      x_neg_one = Numo::Int32[-1]
      result = described_class.call(x_neg_one)
      expect(result).to eq(Numo::Int32[0])
    end

    it 'handles negative numbers correctly' do
      x_neg = Numo::Int32[-5, -10, -1]
      result = described_class.call(x_neg)
      expect(result).to eq(Numo::Int32[4, 9, 0])
    end

    it 'preserves array shape' do
      x_matrix = Numo::Int32[[1, 3], [5, 7]]
      result = described_class.call(x_matrix)
      expect(result.shape).to eq(x_matrix.shape)
      expect(result).to eq(Numo::Int32[[-2, -4], [-6, -8]])
    end

    it 'handles powers of 2 correctly' do
      x_powers = Numo::Int32[1, 2, 4, 8, 16]
      result = described_class.call(x_powers)
      expect(result).to eq(Numo::Int32[-2, -3, -5, -9, -17])
    end

    it 'demonstrates two\'s complement relationship' do
      x_test = Numo::Int32[42, 100, 255]
      result = described_class.call(x_test)
      # ~x = -(x + 1) in two's complement
      expected = -(x_test + 1)
      expect(result).to eq(expected)
    end
  end

  describe '.invert' do
    subject(:result) { NumRuby.invert(x) }

    let(:x) { Numo::Int32[5, 7, 15] }

    it 'performs bitwise NOT operation correctly' do
      expect(result).to eq(Numo::Int32[-6, -8, -16])
    end

    it 'handles zero correctly' do
      x_zero = Numo::Int32[0]
      result = NumRuby.invert(x_zero)
      expect(result).to eq(Numo::Int32[-1])
    end

    it 'is self-inverse when applied twice' do
      x_test = Numo::Int32[42, 123, 200]
      inverted = NumRuby.invert(x_test)
      double_inverted = NumRuby.invert(inverted)
      expect(double_inverted).to eq(x_test)
    end

    it 'handles edge values correctly' do
      # Test with some specific bit patterns
      x_patterns = Numo::Int32[85, 170] # 01010101, 10101010 in 8-bit
      result = NumRuby.invert(x_patterns)
      # Check that bits are flipped correctly
      expect(result.class).to eq(Numo::Int32)
      expect(result).to eq(Numo::Int32[-86, -171])
    end

    it 'demonstrates De Morgan\'s laws with other operations' do
      # This test shows the relationship but doesn't test other operations directly
      # since we're focusing on invert alone
      x_test = Numo::Int32[15] # binary: 1111
      result = NumRuby.invert(x_test)
      expect(result).to eq(Numo::Int32[-16])
    end
  end
end
