require "spec_helper"

RSpec.describe NumRuby::UFunc::Mul do
  it "multiplies two arrays correctly" do
    a = Numo::DFloat[1, 2, 3]
    b = Numo::DFloat[4, 5, 6]
    result = described_class.call(a, b)
    expect(result).to eq(Numo::DFloat[4, 10, 18])
  end
end
