require 'spec_helper'

RSpec.describe NumRuby::UFunc::FloatPower do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[2, 3, 4] }
    let(:y) { Numo::DFloat[2, 3, 2] }

    it 'raises elements to powers correctly' do
      expect(result).to eq(Numo::DFloat[4.0, 27.0, 16.0])
    end

    it 'returns float results for integer inputs' do
      x_int = Numo::Int32[2, 3, 4]
      y_int = Numo::Int32[2, 3, 2]
      result = described_class.call(x_int, y_int)
      expect(result.class).to eq(Numo::DFloat)
      expect(result).to eq(Numo::DFloat[4.0, 27.0, 16.0])
    end
  end

  describe '.float_power' do
    subject(:result) { NumRuby.float_power(x, y) }

    let(:x) { Numo::DFloat[2, 3, 4] }
    let(:y) { Numo::DFloat[2, 3, 2] }

    it 'raises elements to powers correctly' do
      expect(result).to eq(Numo::DFloat[4.0, 27.0, 16.0])
    end

    it 'returns float results for integer inputs' do
      x_int = Numo::Int32[2, 3, 4]
      y_int = Numo::Int32[2, 3, 2]
      result = NumRuby.float_power(x_int, y_int)
      expect(result.class).to eq(Numo::DFloat)
      expect(result).to eq(Numo::DFloat[4.0, 27.0, 16.0])
    end
  end
end
