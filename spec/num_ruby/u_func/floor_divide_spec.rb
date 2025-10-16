require 'spec_helper'

RSpec.describe NumRuby::UFunc::FloorDivide do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[7, 8, 9] }
    let(:y) { Numo::DFloat[2, 3, 4] }

    it 'divides and floors two arrays correctly' do
      expect(result).to eq(Numo::DFloat[3.0, 2.0, 2.0])
    end
  end

  describe '.floor_divide' do
    subject(:result) { NumRuby.floor_divide(x, y) }

    let(:x) { Numo::DFloat[7, 8, 9] }
    let(:y) { Numo::DFloat[2, 3, 4] }

    it 'divides and floors two arrays correctly' do
      expect(result).to eq(Numo::DFloat[3.0, 2.0, 2.0])
    end
  end
end
