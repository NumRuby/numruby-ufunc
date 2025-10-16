require 'spec_helper'

RSpec.describe NumRuby::UFunc::Gcd do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::Int32[12, 18, 24] }
    let(:y) { Numo::Int32[8, 12, 16] }

    it 'computes gcd of two arrays correctly' do
      expect(result).to eq(Numo::Int32[4, 6, 8])
    end

    it 'handles negative values correctly' do
      x_neg = Numo::Int32[-12, 18, -24]
      y_neg = Numo::Int32[8, -12, 16]
      result = described_class.call(x_neg, y_neg)
      expect(result).to eq(Numo::Int32[4, 6, 8])
    end

    it 'handles zero values correctly' do
      x_zero = Numo::Int32[0, 12, 0]
      y_zero = Numo::Int32[5, 0, 0]
      result = described_class.call(x_zero, y_zero)
      expect(result).to eq(Numo::Int32[5, 12, 0])
    end
  end

  describe '.gcd' do
    subject(:result) { NumRuby.gcd(x, y) }

    let(:x) { Numo::Int32[12, 18, 24] }
    let(:y) { Numo::Int32[8, 12, 16] }

    it 'computes gcd of two arrays correctly' do
      expect(result).to eq(Numo::Int32[4, 6, 8])
    end

    it 'handles negative values correctly' do
      x_neg = Numo::Int32[-12, 18, -24]
      y_neg = Numo::Int32[8, -12, 16]
      result = NumRuby.gcd(x_neg, y_neg)
      expect(result).to eq(Numo::Int32[4, 6, 8])
    end
  end
end
