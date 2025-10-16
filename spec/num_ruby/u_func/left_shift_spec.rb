require 'spec_helper'

RSpec.describe NumRuby::UFunc::LeftShift do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::Int32[1, 5, 8, 16] }
    let(:y) { Numo::Int32[1, 2, 3, 1] }

    it 'performs left shift operation correctly' do
      expect(result).to eq(Numo::Int32[2, 20, 64, 32])
    end

    it 'handles zero shift correctly' do
      x_test = Numo::Int32[5, 10, 15]
      y_zero = Numo::Int32[0, 0, 0]
      result = described_class.call(x_test, y_zero)
      expect(result).to eq(x_test)
    end

    it 'handles shift by one correctly' do
      x_test = Numo::Int32[1, 3, 7, 15]
      y_one = Numo::Int32[1, 1, 1, 1]
      result = described_class.call(x_test, y_one)
      expect(result).to eq(Numo::Int32[2, 6, 14, 30])
    end

    it 'preserves array shape' do
      x_matrix = Numo::Int32[[1, 2], [4, 8]]
      y_matrix = Numo::Int32[[1, 2], [1, 3]]
      result = described_class.call(x_matrix, y_matrix)
      expect(result.shape).to eq(x_matrix.shape)
      expect(result).to eq(Numo::Int32[[2, 8], [8, 64]])
    end

    it 'demonstrates multiplication by powers of 2' do
      x_test = Numo::Int32[5, 10, 7]
      y_shifts = Numo::Int32[1, 2, 3]
      result = described_class.call(x_test, y_shifts)
      # 5<<1 = 5*2 = 10, 10<<2 = 10*4 = 40, 7<<3 = 7*8 = 56
      expect(result).to eq(Numo::Int32[10, 40, 56])
    end

    it 'handles large shift values' do
      x_test = Numo::Int32[1, 1, 1]
      y_large = Numo::Int32[10, 15, 20]
      result = described_class.call(x_test, y_large)
      # 1<<10 = 1024, 1<<15 = 32768, 1<<20 = 1048576
      expect(result).to eq(Numo::Int32[1024, 32_768, 1_048_576])
    end

    it 'handles negative numbers correctly' do
      x_neg = Numo::Int32[-1, -5, -10]
      y_shift = Numo::Int32[1, 2, 1]
      result = described_class.call(x_neg, y_shift)
      # Left shift of negative numbers follows two's complement rules
      expect(result.class).to eq(Numo::Int32)
      expect(result).to eq(Numo::Int32[-2, -20, -20])
    end
  end

  describe '.left_shift' do
    subject(:result) { NumRuby.left_shift(x, y) }

    let(:x) { Numo::Int32[1, 5, 8, 16] }
    let(:y) { Numo::Int32[1, 2, 3, 1] }

    it 'performs left shift operation correctly' do
      expect(result).to eq(Numo::Int32[2, 20, 64, 32])
    end

    it 'handles zero shift correctly' do
      x_test = Numo::Int32[5, 10, 15]
      y_zero = Numo::Int32[0, 0, 0]
      result = NumRuby.left_shift(x_test, y_zero)
      expect(result).to eq(x_test)
    end

    it 'demonstrates bit doubling property' do
      # Each left shift by 1 doubles the value
      x_test = Numo::Int32[1, 3, 5, 7]

      # Shift by 1
      result_1 = NumRuby.left_shift(x_test, Numo::Int32[1, 1, 1, 1])
      expect(result_1).to eq(x_test * 2)

      # Shift by 2
      result_2 = NumRuby.left_shift(x_test, Numo::Int32[2, 2, 2, 2])
      expect(result_2).to eq(x_test * 4)

      # Shift by 3
      result_3 = NumRuby.left_shift(x_test, Numo::Int32[3, 3, 3, 3])
      expect(result_3).to eq(x_test * 8)
    end

    it 'handles powers of 2 correctly' do
      powers_of_2 = Numo::Int32[1, 2, 4, 8, 16]
      shifts = Numo::Int32[1, 1, 1, 1, 1]
      result = NumRuby.left_shift(powers_of_2, shifts)
      expect(result).to eq(Numo::Int32[2, 4, 8, 16, 32])
    end

    it 'handles different shift amounts per element' do
      x_test = Numo::Int32[1, 2, 3, 4, 5]
      y_varied = Numo::Int32[0, 1, 2, 3, 4]
      result = NumRuby.left_shift(x_test, y_varied)
      # 1<<0=1, 2<<1=4, 3<<2=12, 4<<3=32, 5<<4=80
      expect(result).to eq(Numo::Int32[1, 4, 12, 32, 80])
    end

    it 'preserves integer type' do
      x_test = Numo::Int32[42, 123]
      y_test = Numo::Int32[2, 1]
      result = NumRuby.left_shift(x_test, y_test)
      expect(result.class).to eq(Numo::Int32)
    end
  end
end
