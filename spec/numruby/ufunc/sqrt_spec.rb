require "spec_helper"

RSpec.describe NumRuby::UFunc::Sqrt do
  it "computes sqrt of an array correctly" do
    a = Numo::DFloat[0, 1, 4, 9]
    result = described_class.call(a)
    expected = Numo::NMath.sqrt(a)

    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
