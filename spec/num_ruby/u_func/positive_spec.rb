require 'spec_helper'

RSpec.describe NumRuby::UFunc::Positive do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, -2, 3] }

    it 'returns positive of array elements correctly' do
      expect(result).to eq(Numo::DFloat[1, -2, 3])
    end
  end

  describe '.positive' do
    subject(:result) { NumRuby.positive(x) }

    let(:x) { Numo::DFloat[1, -2, 3] }

    it 'returns positive of array elements correctly' do
      expect(result).to eq(Numo::DFloat[1, -2, 3])
    end
  end
end
