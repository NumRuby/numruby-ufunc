require 'spec_helper'

RSpec.describe NumRuby::UFunc::Maximum do
  it 'computes elementwise maximum' do
    x = Numo::DFloat[1, 5, 3]
    y = Numo::DFloat[2, 2, 4]
    result = described_class.call(x, y)
    expected = Numo::DFloat[2, 5, 4]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
