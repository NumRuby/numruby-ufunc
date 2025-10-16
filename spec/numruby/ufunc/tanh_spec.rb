require "spec_helper"

RSpec.describe NumRuby::UFunc::Tanh do
  it "computes tanh of array elements" do
    x = Numo::DFloat[0, 1, -1]
    result = described_class.call(x)
    expected = Numo::NMath.tanh(x)
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
