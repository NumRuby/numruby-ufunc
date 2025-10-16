require 'spec_helper'

RSpec.describe NumRuby::UFunc::Logaddexp2 do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'computes logaddexp2 of two arrays correctly' do
      expected = Numo::NMath.log2(Numo::NMath.exp2(x) + Numo::NMath.exp2(y))
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.logaddexp2' do
    subject(:result) { NumRuby.logaddexp2(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'computes logaddexp2 of two arrays correctly' do
      expected = Numo::NMath.log2(Numo::NMath.exp2(x) + Numo::NMath.exp2(y))
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
