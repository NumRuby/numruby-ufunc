require 'spec_helper'

RSpec.describe NumRuby::UFunc::Tan do
  it 'computes tan of an array correctly' do
    x = Numo::DFloat[0, Math::PI / 4, Math::PI / 6]
    result = described_class.call(x)
    expected = Numo::NMath.tan(x)

    diff = (result - expected).abs
    expect(diff.max).to be < 1e-12
  end
end
