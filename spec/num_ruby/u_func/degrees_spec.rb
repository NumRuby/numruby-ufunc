require 'spec_helper'

RSpec.describe NumRuby::UFunc::Degrees do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, Math::PI / 6, Math::PI / 4, Math::PI / 2, Math::PI] }

    it 'converts radians to degrees correctly' do
      expected = Numo::DFloat[0.0, 30.0, 45.0, 90.0, 180.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative angles correctly' do
      x_neg = Numo::DFloat[-Math::PI, -Math::PI / 2, -Math::PI / 4]
      result = described_class.call(x_neg)
      expected = Numo::DFloat[-180.0, -90.0, -45.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles zero correctly' do
      x_zero = Numo::DFloat[0]
      result = described_class.call(x_zero)
      expect(result[0]).to eq(0.0)
    end

    it 'handles full circle correctly' do
      x_circle = Numo::DFloat[2 * Math::PI]
      result = described_class.call(x_circle)
      expected = Numo::DFloat[360.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles large angles correctly' do
      x_large = Numo::DFloat[4 * Math::PI, 6 * Math::PI]
      result = described_class.call(x_large)
      expected = Numo::DFloat[720.0, 1080.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-10
    end

    it 'preserves array shape' do
      x_matrix = Numo::DFloat[[0, Math::PI / 4], [Math::PI / 2, Math::PI]]
      result = described_class.call(x_matrix)
      expect(result.shape).to eq(x_matrix.shape)
    end
  end

  describe '.degrees' do
    subject(:result) { NumRuby.degrees(x) }

    let(:x) { Numo::DFloat[0, Math::PI / 6, Math::PI / 4, Math::PI / 2, Math::PI] }

    it 'converts radians to degrees correctly' do
      expected = Numo::DFloat[0.0, 30.0, 45.0, 90.0, 180.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative angles correctly' do
      x_neg = Numo::DFloat[-Math::PI, -Math::PI / 2, -Math::PI / 4]
      result = NumRuby.degrees(x_neg)
      expected = Numo::DFloat[-180.0, -90.0, -45.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'matches manual calculation' do
      x_test = Numo::DFloat[1.0] # 1 radian
      result = NumRuby.degrees(x_test)
      expected = 1.0 * (180.0 / Math::PI)
      expect((result[0] - expected).abs).to be < 1e-14
    end
  end
end
