require "spec_helper"

RSpec.describe NumRuby::UFunc::Tan do
  it "computes tan of an array correctly" do
    a = Numo::DFloat[0, Math::PI / 4, Math::PI / 6]
    result = described_class.call(a)
    expected = Numo::NMath.tan(a)

    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
