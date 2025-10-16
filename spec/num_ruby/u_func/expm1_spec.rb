require 'spec_helper'

RSpec.describe NumRuby::UFunc::Expm1 do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, 1, 2] }

    it 'computes expm1 of array elements correctly' do
      expected = Numo::NMath.exp(x) - 1
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.expm1' do
    subject(:result) { NumRuby.expm1(x) }

    let(:x) { Numo::DFloat[0, 1, 2] }

    it 'computes expm1 of array elements correctly' do
      expected = Numo::NMath.exp(x) - 1
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
