require 'spec_helper'

RSpec.describe NumRuby::UFunc::Divide do
  it 'divides two arrays correctly' do
    x = Numo::DFloat[1, 2, 3]
    y = Numo::DFloat[4, 5, 6]
    result = described_class.call(x, y)
    expect(result).to eq(Numo::DFloat[0.25, 0.4, 0.5])
  end
end
