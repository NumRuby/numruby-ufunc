require "spec_helper"

RSpec.describe NumRuby::UFunc::Cosh do
  it "computes cosh of array elements" do
    x = Numo::DFloat[0, 1, -1]
    result = described_class.call(x)
    expected = Numo::NMath.cosh(x)
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
