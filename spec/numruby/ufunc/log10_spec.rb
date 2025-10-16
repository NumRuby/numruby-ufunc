require 'spec_helper'

RSpec.describe NumRuby::UFunc::Log10 do
  it 'computes log10 of array elements' do
    x = Numo::DFloat[1, 10, 100]
    result = described_class.call(x)
    expected = Numo::NMath.log10(x)
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
