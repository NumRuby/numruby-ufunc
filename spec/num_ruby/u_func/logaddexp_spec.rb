require 'spec_helper'

RSpec.describe NumRuby::UFunc::Logaddexp do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'computes logaddexp of two arrays correctly' do
      expected = Numo::NMath.log(Numo::NMath.exp(x) + Numo::NMath.exp(y))
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.logaddexp' do
    subject(:result) { NumRuby.logaddexp(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'computes logaddexp of two arrays correctly' do
      expected = Numo::NMath.log(Numo::NMath.exp(x) + Numo::NMath.exp(y))
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
