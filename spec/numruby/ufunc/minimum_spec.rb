require "spec_helper"

RSpec.describe NumRuby::UFunc::Minimum do
  it "computes elementwise minimum" do
    x = Numo::DFloat[1, 5, 3]
    y = Numo::DFloat[2, 2, 4]
    result = described_class.call(x, y)
    expected = Numo::DFloat[1, 2, 3]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
