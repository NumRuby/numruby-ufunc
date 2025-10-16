require 'spec_helper'

RSpec.describe NumRuby::UFunc::Fabs do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[-1, 2, -3, 4] }

    it 'computes absolute values correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 2.0, 3.0, 4.0])
    end
  end

  describe '.fabs' do
    subject(:result) { NumRuby.fabs(x) }

    let(:x) { Numo::DFloat[-1, 2, -3, 4] }

    it 'computes absolute values correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 2.0, 3.0, 4.0])
    end
  end
end
