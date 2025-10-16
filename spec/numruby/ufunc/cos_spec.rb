require "spec_helper"

RSpec.describe NumRuby::UFunc::Cos do
  it "computes cos of an array correctly" do
    a = Numo::DFloat[0, Math::PI / 2, Math::PI]
    result = described_class.call(a)
    expected = Numo::DFloat[1, 0, -1]

    # elementwise comparison with tolerance
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
