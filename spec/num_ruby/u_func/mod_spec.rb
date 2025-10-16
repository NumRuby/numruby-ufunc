require 'spec_helper'

RSpec.describe NumRuby::UFunc::Mod do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[7, 8, 9] }
    let(:y) { Numo::DFloat[2, 3, 4] }

    it 'computes modulus of two arrays correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 2.0, 1.0])
    end
  end

  describe '.mod' do
    subject(:result) { NumRuby.mod(x, y) }

    let(:x) { Numo::DFloat[7, 8, 9] }
    let(:y) { Numo::DFloat[2, 3, 4] }

    it 'computes modulus of two arrays correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 2.0, 1.0])
    end
  end
end
