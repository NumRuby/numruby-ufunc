require 'spec_helper'

RSpec.describe NumRuby::UFunc::RightShift do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::Int32[8, 20, 64, 32] }
    let(:y) { Numo::Int32[1, 2, 3, 1] }

    it 'performs right shift operation correctly' do
      expect(result).to eq(Numo::Int32[4, 5, 8, 16])
    end

    it 'handles zero shift correctly' do
      x_test = Numo::Int32[5, 10, 15]
      y_zero = Numo::Int32[0, 0, 0]
      result = described_class.call(x_test, y_zero)
      expect(result).to eq(x_test)
    end

    it 'handles shift by one correctly' do
      x_test = Numo::Int32[2, 6, 14, 30]
      y_one = Numo::Int32[1, 1, 1, 1]
      result = described_class.call(x_test, y_one)
      expect(result).to eq(Numo::Int32[1, 3, 7, 15])
    end

    it 'preserves array shape' do
      x_matrix = Numo::Int32[[8, 16], [32, 64]]
      y_matrix = Numo::Int32[[1, 2], [1, 3]]
      result = described_class.call(x_matrix, y_matrix)
      expect(result.shape).to eq(x_matrix.shape)
      expect(result).to eq(Numo::Int32[[4, 4], [16, 8]])
    end

    it 'demonstrates division by powers of 2' do
      x_test = Numo::Int32[20, 40, 56]
      y_shifts = Numo::Int32[1, 2, 3]
      result = described_class.call(x_test, y_shifts)
      # 20>>1 = 20/2 = 10, 40>>2 = 40/4 = 10, 56>>3 = 56/8 = 7
      expect(result).to eq(Numo::Int32[10, 10, 7])
    end

    it 'handles large shift values' do
      x_test = Numo::Int32[1024, 32_768, 1_048_576]
      y_large = Numo::Int32[10, 15, 20]
      result = described_class.call(x_test, y_large)
      # 1024>>10 = 1, 32768>>15 = 1, 1048576>>20 = 1
      expect(result).to eq(Numo::Int32[1, 1, 1])
    end

    it 'handles negative numbers correctly (arithmetic right shift)' do
      x_neg = Numo::Int32[-8, -20, -40]
      y_shift = Numo::Int32[1, 2, 1]
      result = described_class.call(x_neg, y_shift)
      # Arithmetic right shift preserves sign bit
      expect(result.class).to eq(Numo::Int32)
      expect(result).to eq(Numo::Int32[-4, -5, -20])
    end

    it 'handles odd numbers correctly' do
      x_odd = Numo::Int32[7, 15, 31]
      y_shift = Numo::Int32[1, 2, 3]
      result = described_class.call(x_odd, y_shift)
      # Right shift truncates (floors for positive numbers)
      expect(result).to eq(Numo::Int32[3, 3, 3])
    end
  end

  describe '.right_shift' do
    subject(:result) { NumRuby.right_shift(x, y) }

    let(:x) { Numo::Int32[8, 20, 64, 32] }
    let(:y) { Numo::Int32[1, 2, 3, 1] }

    it 'performs right shift operation correctly' do
      expect(result).to eq(Numo::Int32[4, 5, 8, 16])
    end

    it 'handles zero shift correctly' do
      x_test = Numo::Int32[5, 10, 15]
      y_zero = Numo::Int32[0, 0, 0]
      result = NumRuby.right_shift(x_test, y_zero)
      expect(result).to eq(x_test)
    end

    it 'demonstrates bit halving property' do
      # Each right shift by 1 halves the value (truncated)
      x_test = Numo::Int32[8, 12, 20, 28]

      # Shift by 1
      result1 = NumRuby.right_shift(x_test, Numo::Int32[1, 1, 1, 1])
      expect(result1).to eq(Numo::Int32[4, 6, 10, 14])

      # Shift by 2
      result2 = NumRuby.right_shift(x_test, Numo::Int32[2, 2, 2, 2])
      expect(result2).to eq(Numo::Int32[2, 3, 5, 7])

      # Shift by 3
      result3 = NumRuby.right_shift(x_test, Numo::Int32[3, 3, 3, 3])
      expect(result3).to eq(Numo::Int32[1, 1, 2, 3])
    end

    it 'handles powers of 2 correctly' do
      powers_of_2 = Numo::Int32[32, 16, 8, 4, 2]
      shifts = Numo::Int32[1, 1, 1, 1, 1]
      result = NumRuby.right_shift(powers_of_2, shifts)
      expect(result).to eq(Numo::Int32[16, 8, 4, 2, 1])
    end

    it 'handles different shift amounts per element' do
      x_test = Numo::Int32[80, 32, 12, 4, 1]
      y_varied = Numo::Int32[4, 3, 2, 1, 0]
      result = NumRuby.right_shift(x_test, y_varied)
      # 80>>4=5, 32>>3=4, 12>>2=3, 4>>1=2, 1>>0=1
      expect(result).to eq(Numo::Int32[5, 4, 3, 2, 1])
    end

    it 'preserves integer type' do
      x_test = Numo::Int32[42, 123]
      y_test = Numo::Int32[2, 1]
      result = NumRuby.right_shift(x_test, y_test)
      expect(result.class).to eq(Numo::Int32)
    end

    it 'is inverse of left shift for powers of 2' do
      x_test = Numo::Int32[5, 10, 7]
      shifts = Numo::Int32[1, 2, 3]

      # Left shift then right shift should return original (for values that don't overflow)
      left_shifted = NumRuby.left_shift(x_test, shifts)
      back_shifted = NumRuby.right_shift(left_shifted, shifts)
      expect(back_shifted).to eq(x_test)
    end

    it 'handles large numbers correctly' do
      x_large = Numo::Int32[1000, 2000, 4000]
      y_shift = Numo::Int32[2, 3, 4]
      result = NumRuby.right_shift(x_large, y_shift)
      # 1000>>2=250, 2000>>3=250, 4000>>4=250
      expect(result).to eq(Numo::Int32[250, 250, 250])
    end
  end
end
