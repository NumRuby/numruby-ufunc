require 'spec_helper'

RSpec.describe NumRuby::UFunc::Log1p do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, 1, 2] }

    it 'computes log1p of array elements correctly' do
      expected = Numo::NMath.log(1 + x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.log1p' do
    subject(:result) { NumRuby.log1p(x) }

    let(:x) { Numo::DFloat[0, 1, 2] }

    it 'computes log1p of array elements correctly' do
      expected = Numo::NMath.log(1 + x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
