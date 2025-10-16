require "spec_helper"

RSpec.describe NumRuby::UFunc::Abs do
  it "computes absolute value of array" do
    x = Numo::DFloat[-1, -2, 3]
    result = described_class.call(x)
    expected = Numo::DFloat[1, 2, 3]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
