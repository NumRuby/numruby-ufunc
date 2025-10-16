require "spec_helper"

RSpec.describe NumRuby::UFunc::Pow do
  it "computes elementwise power" do
    x = Numo::DFloat[2, 3, 4]
    y = Numo::DFloat[3, 2, 1]
    result = described_class.call(x, y)
    expected = Numo::DFloat[8, 9, 4]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
