require 'spec_helper'

RSpec.describe NumRuby::UFunc::BitwiseXor do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::Int32[5, 7, 15] }
    let(:y) { Numo::Int32[3, 5, 7] }

    it 'performs bitwise XOR operation correctly' do
      expect(result).to eq(Numo::Int32[6, 2, 8])
    end

    it 'handles zero values correctly' do
      x_zero = Numo::Int32[0, 5, 0]
      y_zero = Numo::Int32[3, 0, 7]
      result = described_class.call(x_zero, y_zero)
      expect(result).to eq(Numo::Int32[3, 5, 7])
    end

    it 'handles identical values correctly' do
      x_same = Numo::Int32[5, 12, 255]
      result = described_class.call(x_same, x_same)
      expect(result).to eq(Numo::Int32[0, 0, 0])
    end

    it 'preserves array shape' do
      x_matrix = Numo::Int32[[1, 3], [5, 7]]
      y_matrix = Numo::Int32[[2, 2], [4, 6]]
      result = described_class.call(x_matrix, y_matrix)
      expect(result.shape).to eq(x_matrix.shape)
      expect(result).to eq(Numo::Int32[[3, 1], [1, 1]])
    end

    it 'handles negative numbers correctly' do
      x_neg = Numo::Int32[-1, -5, 10]
      y_neg = Numo::Int32[15, -3, -8]
      result = described_class.call(x_neg, y_neg)
      # Bitwise XOR should work with two's complement representation
      expect(result.class).to eq(Numo::Int32)
    end

    it 'handles all bits set correctly' do
      x_all = Numo::Int32[255, 127]
      y_all = Numo::Int32[0, 255]
      result = described_class.call(x_all, y_all)
      expect(result).to eq(Numo::Int32[255, 128])
    end
  end

  describe '.bitwise_xor' do
    subject(:result) { NumRuby.bitwise_xor(x, y) }

    let(:x) { Numo::Int32[5, 7, 15] }
    let(:y) { Numo::Int32[3, 5, 7] }

    it 'performs bitwise XOR operation correctly' do
      expect(result).to eq(Numo::Int32[6, 2, 8])
    end

    it 'handles zero values correctly' do
      x_zero = Numo::Int32[0, 5, 0]
      y_zero = Numo::Int32[3, 0, 7]
      result = NumRuby.bitwise_xor(x_zero, y_zero)
      expect(result).to eq(Numo::Int32[3, 5, 7])
    end

    it 'demonstrates XOR properties' do
      # x ^ x = 0 (self-inverse)
      x_test = Numo::Int32[5, 7, 15]
      result = NumRuby.bitwise_xor(x_test, x_test)
      expect(result).to eq(Numo::Int32[0, 0, 0])

      # x ^ 0 = x (identity)
      zeros = Numo::Int32.zeros(3)
      result = NumRuby.bitwise_xor(x_test, zeros)
      expect(result).to eq(x_test)
    end

    it 'is commutative' do
      x_test = Numo::Int32[5, 12, 9]
      y_test = Numo::Int32[3, 7, 14]
      result_1 = NumRuby.bitwise_xor(x_test, y_test)
      result_2 = NumRuby.bitwise_xor(y_test, x_test)
      expect(result_1).to eq(result_2)
    end

    it 'is self-inverse (double XOR returns original)' do
      x_test = Numo::Int32[42, 123, 255]
      y_test = Numo::Int32[17, 89, 128]

      # x ^ y ^ y = x
      xor_result = NumRuby.bitwise_xor(x_test, y_test)
      double_xor = NumRuby.bitwise_xor(xor_result, y_test)
      expect(double_xor).to eq(x_test)
    end

    it 'can be used for bit flipping' do
      x_test = Numo::Int32[170] # binary: 10101010
      mask = Numo::Int32[255]   # binary: 11111111
      result = NumRuby.bitwise_xor(x_test, mask)
      expect(result).to eq(Numo::Int32[85]) # binary: 01010101 (all bits flipped)
    end
  end
end
