require "spec_helper"

RSpec.describe NumRuby::UFunc::Round do
  it "rounds array elements to nearest integer" do
    x = Numo::DFloat[1.4, 2.5, -1.7]
    result = described_class.call(x)
    expected = Numo::DFloat[1, 3, -2]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
