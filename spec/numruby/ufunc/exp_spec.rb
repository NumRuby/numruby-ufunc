require "spec_helper"

RSpec.describe NumRuby::UFunc::Exp do
  it "computes exp of an array correctly" do
    a = Numo::DFloat[0, 1, 2]
    result = described_class.call(a)
    expected = Numo::NMath.exp(a)

    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
