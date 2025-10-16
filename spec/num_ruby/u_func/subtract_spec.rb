require 'spec_helper'

RSpec.describe NumRuby::UFunc::Subtract do
  it 'subtracts two arrays correctly' do
    x = Numo::DFloat[5, 7, 9]
    y = Numo::DFloat[1, 2, 3]
    result = described_class.call(x, y)
    expect(result).to eq(Numo::DFloat[4, 5, 6])
  end
end
