require "spec_helper"

RSpec.describe NumRuby::UFunc::Exp2 do
  it "computes 2^x for array elements" do
    x = Numo::DFloat[0, 1, 3]
    result = described_class.call(x)
    expected = Numo::DFloat[1, 2, 8]
    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
