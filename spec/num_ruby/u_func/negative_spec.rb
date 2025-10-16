require 'spec_helper'

RSpec.describe NumRuby::UFunc::Negative do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, -2, 3] }

    it 'negates array elements correctly' do
      expect(result).to eq(Numo::DFloat[-1, 2, -3])
    end
  end

  describe '.negative' do
    subject(:result) { NumRuby.negative(x) }

    let(:x) { Numo::DFloat[1, -2, 3] }

    it 'negates array elements correctly' do
      expect(result).to eq(Numo::DFloat[-1, 2, -3])
    end
  end
end
