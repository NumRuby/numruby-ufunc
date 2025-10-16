require "spec_helper"

RSpec.describe NumRuby::UFunc::Ceil do
  it "computes ceiling of array elements" do
    x = Numo::DFloat[1.1, 2.5, -1.7]
    result = described_class.call(x)
    expected = Numo::DFloat[2, 3, -1]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
