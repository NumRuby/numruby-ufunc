require 'spec_helper'

RSpec.describe NumRuby::UFunc::Lcm do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::Int32[4, 6, 8] }
    let(:y) { Numo::Int32[6, 8, 12] }

    it 'computes lcm of two arrays correctly' do
      expect(result).to eq(Numo::Int32[12, 24, 24])
    end

    it 'handles negative values correctly' do
      x_neg = Numo::Int32[-4, 6, -8]
      y_neg = Numo::Int32[6, -8, 12]
      result = described_class.call(x_neg, y_neg)
      expect(result).to eq(Numo::Int32[12, 24, 24])
    end

    it 'handles zero values correctly' do
      x_zero = Numo::Int32[0, 6, 0]
      y_zero = Numo::Int32[5, 0, 0]
      result = described_class.call(x_zero, y_zero)
      expect(result).to eq(Numo::Int32[0, 0, 0])
    end

    it 'handles simple cases correctly' do
      x_simple = Numo::Int32[2, 3, 4]
      y_simple = Numo::Int32[3, 4, 5]
      result = described_class.call(x_simple, y_simple)
      expect(result).to eq(Numo::Int32[6, 12, 20])
    end
  end

  describe '.lcm' do
    subject(:result) { NumRuby.lcm(x, y) }

    let(:x) { Numo::Int32[4, 6, 8] }
    let(:y) { Numo::Int32[6, 8, 12] }

    it 'computes lcm of two arrays correctly' do
      expect(result).to eq(Numo::Int32[12, 24, 24])
    end

    it 'handles negative values correctly' do
      x_neg = Numo::Int32[-4, 6, -8]
      y_neg = Numo::Int32[6, -8, 12]
      result = NumRuby.lcm(x_neg, y_neg)
      expect(result).to eq(Numo::Int32[12, 24, 24])
    end
  end
end
