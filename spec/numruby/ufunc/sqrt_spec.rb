require "spec_helper"

RSpec.describe NumRuby::UFunc::Sqrt do
  it "computes sqrt of an array correctly" do
    x = Numo::DFloat[0, 1, 4, 9]
    result = described_class.call(x)
    expected = Numo::NMath.sqrt(x)

    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
