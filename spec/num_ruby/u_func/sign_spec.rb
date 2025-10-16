require 'spec_helper'

RSpec.describe NumRuby::UFunc::Sign do
  it 'computes sign of array elements' do
    x = Numo::DFloat[-5, 0, 7]
    result = described_class.call(x)
    expected = Numo::DFloat[-1, 0, 1]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
