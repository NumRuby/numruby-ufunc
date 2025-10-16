require 'spec_helper'

RSpec.describe NumRuby::UFunc::Log2 do
  it 'computes log2 of array elements' do
    x = Numo::DFloat[1, 2, 8]
    result = described_class.call(x)
    expected = Numo::NMath.log(x) / Math.log(2)
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
