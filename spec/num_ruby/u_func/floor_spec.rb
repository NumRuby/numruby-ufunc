require 'spec_helper'

RSpec.describe NumRuby::UFunc::Floor do
  it 'computes floor of array elements' do
    x = Numo::DFloat[1.9, 2.5, -1.7]
    result = described_class.call(x)
    expected = Numo::DFloat[1, 2, -2]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
