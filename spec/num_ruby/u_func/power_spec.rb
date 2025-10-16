require 'spec_helper'

RSpec.describe NumRuby::UFunc::Power do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[2, 3, 4] }
    let(:y) { Numo::DFloat[2, 3, 2] }

    it 'raises elements to powers correctly' do
      expect(result).to eq(Numo::DFloat[4.0, 27.0, 16.0])
    end
  end

  describe '.power' do
    subject(:result) { NumRuby.power(x, y) }

    let(:x) { Numo::DFloat[2, 3, 4] }
    let(:y) { Numo::DFloat[2, 3, 2] }

    it 'raises elements to powers correctly' do
      expect(result).to eq(Numo::DFloat[4.0, 27.0, 16.0])
    end
  end
end
