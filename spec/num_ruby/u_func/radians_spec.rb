require 'spec_helper'

RSpec.describe NumRuby::UFunc::Radians do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, 30, 45, 90, 180] }

    it 'converts degrees to radians correctly' do
      expected = Numo::DFloat[0.0, Math::PI / 6, Math::PI / 4, Math::PI / 2, Math::PI]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative angles correctly' do
      x_neg = Numo::DFloat[-180, -90, -45, -30]
      result = described_class.call(x_neg)
      expected = Numo::DFloat[-Math::PI, -Math::PI / 2, -Math::PI / 4, -Math::PI / 6]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles zero correctly' do
      x_zero = Numo::DFloat[0]
      result = described_class.call(x_zero)
      expect(result[0]).to eq(0.0)
    end

    it 'handles full circle correctly' do
      x_circle = Numo::DFloat[360]
      result = described_class.call(x_circle)
      expected = Numo::DFloat[2 * Math::PI]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles large angles correctly' do
      x_large = Numo::DFloat[720, 1080]
      result = described_class.call(x_large)
      expected = Numo::DFloat[4 * Math::PI, 6 * Math::PI]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-10
    end

    it 'preserves array shape' do
      x_matrix = Numo::DFloat[[0, 45], [90, 180]]
      result = described_class.call(x_matrix)
      expect(result.shape).to eq(x_matrix.shape)
    end

    it 'is inverse of degrees conversion' do
      x_test = Numo::DFloat[57.2958] # approximately 1 radian in degrees
      radians_result = described_class.call(x_test)
      degrees_back = radians_result * (180.0 / Math::PI)
      diff = (degrees_back - x_test).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.radians' do
    subject(:result) { NumRuby.radians(x) }

    let(:x) { Numo::DFloat[0, 30, 45, 90, 180] }

    it 'converts degrees to radians correctly' do
      expected = Numo::DFloat[0.0, Math::PI / 6, Math::PI / 4, Math::PI / 2, Math::PI]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative angles correctly' do
      x_neg = Numo::DFloat[-180, -90, -45, -30]
      result = NumRuby.radians(x_neg)
      expected = Numo::DFloat[-Math::PI, -Math::PI / 2, -Math::PI / 4, -Math::PI / 6]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'matches manual calculation' do
      x_test = Numo::DFloat[180.0] # 180 degrees = π radians
      result = NumRuby.radians(x_test)
      expected = Math::PI
      expect((result[0] - expected).abs).to be < 1e-14
    end

    it 'handles common angles correctly' do
      common_degrees = Numo::DFloat[30, 45, 60, 90, 120, 135, 150, 180]
      result = NumRuby.radians(common_degrees)
      expected = Numo::DFloat[
        Math::PI / 6,     # 30°
        Math::PI / 4,     # 45°
        Math::PI / 3,     # 60°
        Math::PI / 2,     # 90°
        2 * Math::PI / 3, # 120°
        3 * Math::PI / 4, # 135°
        5 * Math::PI / 6, # 150°
        Math::PI          # 180°
      ]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
