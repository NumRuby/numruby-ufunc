require 'spec_helper'

RSpec.describe NumRuby::UFunc::Cbrt do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, 8, 27, 64] }

    it 'computes cube root of array elements correctly' do
      expected = Numo::DFloat[1.0, 2.0, 3.0, 4.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.cbrt' do
    subject(:result) { NumRuby.cbrt(x) }

    let(:x) { Numo::DFloat[1, 8, 27, 64] }

    it 'computes cube root of array elements correctly' do
      expected = Numo::DFloat[1.0, 2.0, 3.0, 4.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
