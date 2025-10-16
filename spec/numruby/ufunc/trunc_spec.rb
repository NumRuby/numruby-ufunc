require "spec_helper"

RSpec.describe NumRuby::UFunc::Trunc do
  it "truncates array elements" do
    x = Numo::DFloat[1.9, 2.5, -1.7]
    result = described_class.call(x)
    expected = Numo::DFloat[1, 2, -1]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
