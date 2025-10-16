require 'spec_helper'

RSpec.describe NumRuby::UFunc::Add do
  describe '.call' do
    subject { described_class.call(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'adds two arrays correctly' do
      expect(subject).to eq(Numo::DFloat[5, 7, 9])
    end
  end

  describe '.add' do
    subject { NumRuby.add(x, y) }

    let(:x) { Numo::DFloat[1, 2, 3] }
    let(:y) { Numo::DFloat[4, 5, 6] }

    it 'adds two arrays correctly' do
      expect(subject).to eq(Numo::DFloat[5, 7, 9])
    end
  end
end
