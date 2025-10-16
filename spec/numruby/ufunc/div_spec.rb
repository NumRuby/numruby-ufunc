require "spec_helper"

RSpec.describe NumRuby::UFunc::Div do
  it "divides two arrays correctly" do
    a = Numo::DFloat[1, 2, 3]
    b = Numo::DFloat[4, 5, 6]
    result = described_class.call(a, b)
    expect(result).to eq(Numo::DFloat[0.25, 0.4, 0.5])
  end
end
