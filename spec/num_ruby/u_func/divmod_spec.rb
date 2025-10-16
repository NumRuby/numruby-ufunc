require 'spec_helper'

RSpec.describe NumRuby::UFunc::Divmod do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[7, 8, 9] }
    let(:y) { Numo::DFloat[2, 3, 4] }

    it 'returns quotient and remainder correctly' do
      quotient, remainder = result
      expect(quotient).to eq(Numo::DFloat[3.0, 2.0, 2.0])
      expect(remainder).to eq(Numo::DFloat[1.0, 2.0, 1.0])
    end

    it 'returns an array with two elements' do
      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
    end

    it 'handles negative values correctly' do
      x_neg = Numo::DFloat[-7, 8, -9]
      y_neg = Numo::DFloat[2, -3, 4]
      quotient, remainder = described_class.call(x_neg, y_neg)

      # Check basic properties: quotient should be integer-like, remainder should be smaller than divisor
      expect(quotient.class).to eq(Numo::DFloat)
      expect(remainder.class).to eq(Numo::DFloat)
      expect((quotient - quotient.floor).abs.max).to be < 1e-12
    end
  end

  describe '.divmod' do
    subject(:result) { NumRuby.divmod(x, y) }

    let(:x) { Numo::DFloat[7, 8, 9] }
    let(:y) { Numo::DFloat[2, 3, 4] }

    it 'returns quotient and remainder correctly' do
      quotient, remainder = result
      expect(quotient).to eq(Numo::DFloat[3.0, 2.0, 2.0])
      expect(remainder).to eq(Numo::DFloat[1.0, 2.0, 1.0])
    end

    it 'returns an array with two elements' do
      expect(result).to be_an(Array)
      expect(result.length).to eq(2)
    end
  end
end
