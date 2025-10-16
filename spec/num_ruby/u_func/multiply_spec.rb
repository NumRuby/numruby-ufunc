require 'spec_helper'

RSpec.describe NumRuby::UFunc::Multiply do
  it 'multiplies two arrays correctly' do
    x = Numo::DFloat[1, 2, 3]
    y = Numo::DFloat[4, 5, 6]
    result = described_class.call(x, y)
    expect(result).to eq(Numo::DFloat[4, 10, 18])
  end
end
