require 'spec_helper'

RSpec.describe NumRuby::UFunc::Square do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[1, 2, 3, 4] }

    it 'squares array elements correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 4.0, 9.0, 16.0])
    end
  end

  describe '.square' do
    subject(:result) { NumRuby.square(x) }

    let(:x) { Numo::DFloat[1, 2, 3, 4] }

    it 'squares array elements correctly' do
      expect(result).to eq(Numo::DFloat[1.0, 4.0, 9.0, 16.0])
    end
  end
end
