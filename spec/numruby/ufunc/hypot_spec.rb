require "spec_helper"

RSpec.describe NumRuby::UFunc::Hypot do
  it "computes elementwise hypot (sqrt(a^2 + b^2))" do
    x = Numo::DFloat[3, 5, 8]
    y = Numo::DFloat[4, 12, 15]
    result = described_class.call(x, y)
    expected = Numo::NMath.sqrt(x**2 + y**2)
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
