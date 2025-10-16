require 'spec_helper'

RSpec.describe NumRuby::UFunc::Arccos do
  it 'computes arccos of array elements' do
    x = Numo::DFloat[-1, 0, 1]
    result = described_class.call(x)
    expected = Numo::NMath.acos(x)
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
