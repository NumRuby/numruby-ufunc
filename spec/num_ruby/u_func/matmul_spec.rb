require 'spec_helper'

RSpec.describe NumRuby::UFunc::Matmul do
  describe '.call' do
    subject(:result) { described_class.call(x, y) }

    let(:x) { Numo::DFloat[[1, 2], [3, 4]] }
    let(:y) { Numo::DFloat[[5, 6], [7, 8]] }

    it 'multiplies two matrices correctly' do
      expect(result).to eq(Numo::DFloat[[19, 22], [43, 50]])
    end
  end

  describe '.matmul' do
    subject(:result) { NumRuby.matmul(x, y) }

    let(:x) { Numo::DFloat[[1, 2], [3, 4]] }
    let(:y) { Numo::DFloat[[5, 6], [7, 8]] }

    it 'multiplies two matrices correctly' do
      expect(result).to eq(Numo::DFloat[[19, 22], [43, 50]])
    end
  end
end
