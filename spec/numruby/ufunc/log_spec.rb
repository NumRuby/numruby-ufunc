require "spec_helper"

RSpec.describe NumRuby::UFunc::Log do
  it "computes log of an array correctly" do
    a = Numo::DFloat[1, Math::E, Math::E**2]
    result = described_class.call(a)
    expected = Numo::NMath.log(a)

    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
