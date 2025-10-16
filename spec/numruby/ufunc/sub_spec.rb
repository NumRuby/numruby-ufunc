require "spec_helper"

RSpec.describe NumRuby::UFunc::Sub do
  it "subtracts two arrays correctly" do
    a = Numo::DFloat[5, 7, 9]
    b = Numo::DFloat[1, 2, 3]
    result = described_class.call(a, b)
    expect(result).to eq(Numo::DFloat[4, 5, 6])
  end
end
