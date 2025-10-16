require 'spec_helper'

RSpec.describe NumRuby::UFunc::Reciprocal do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, 2, 4, 8] }

    it 'computes reciprocal of array elements correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 0.5, 0.25, 0.125])
    end
  end

  describe '.reciprocal' do
    subject(:result) { NumRuby.reciprocal(x) }

    let(:x) { Numo::DFloat[1, 2, 4, 8] }

    it 'computes reciprocal of array elements correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 0.5, 0.25, 0.125])
    end
  end
end
