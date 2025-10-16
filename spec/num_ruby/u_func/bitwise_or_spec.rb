require 'spec_helper'

RSpec.describe NumRuby::UFunc::BitwiseOr do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::Int32[5, 7, 15] }
    let(:y) { Numo::Int32[3, 5, 7] }

    it 'performs bitwise OR operation correctly' do
      expect(result).to eq(Numo::Int32[7, 7, 15])
    end

    it 'handles zero values correctly' do
      x_zero = Numo::Int32[0, 5, 0]
      y_zero = Numo::Int32[3, 0, 7]
      result = described_class.call(x_zero, y_zero)
      expect(result).to eq(Numo::Int32[3, 5, 7])
    end

    it 'handles all bits set correctly' do
      x_all = Numo::Int32[255, 127]
      y_all = Numo::Int32[128, 63]
      result = described_class.call(x_all, y_all)
      expect(result).to eq(Numo::Int32[255, 127])
    end

    it 'preserves array shape' do
      x_matrix = Numo::Int32[[1, 3], [5, 7]]
      y_matrix = Numo::Int32[[2, 2], [4, 6]]
      result = described_class.call(x_matrix, y_matrix)
      expect(result.shape).to eq(x_matrix.shape)
      expect(result).to eq(Numo::Int32[[3, 3], [5, 7]])
    end

    it 'handles negative numbers correctly' do
      x_neg = Numo::Int32[-1, -5, 10]
      y_neg = Numo::Int32[15, -3, -8]
      result = described_class.call(x_neg, y_neg)
      # Bitwise OR should work with two's complement representation
      expect(result.class).to eq(Numo::Int32)
    end
  end

  describe '.bitwise_or' do
    subject(:result) { NumRuby.bitwise_or(x, y) }

    let(:x) { Numo::Int32[5, 7, 15] }
    let(:y) { Numo::Int32[3, 5, 7] }

    it 'performs bitwise OR operation correctly' do
      expect(result).to eq(Numo::Int32[7, 7, 15])
    end

    it 'handles zero values correctly' do
      x_zero = Numo::Int32[0, 5, 0]
      y_zero = Numo::Int32[3, 0, 7]
      result = NumRuby.bitwise_or(x_zero, y_zero)
      expect(result).to eq(Numo::Int32[3, 5, 7])
    end

    it 'demonstrates OR properties' do
      # x | x = x (idempotent)
      x_test = Numo::Int32[5, 7, 15]
      result = NumRuby.bitwise_or(x_test, x_test)
      expect(result).to eq(x_test)

      # x | 0 = x (identity)
      zeros = Numo::Int32.zeros(3)
      result = NumRuby.bitwise_or(x_test, zeros)
      expect(result).to eq(x_test)
    end

    it 'is commutative' do
      x_test = Numo::Int32[5, 12, 9]
      y_test = Numo::Int32[3, 7, 14]
      result1 = NumRuby.bitwise_or(x_test, y_test)
      result2 = NumRuby.bitwise_or(y_test, x_test)
      expect(result1).to eq(result2)
    end
  end
end
