require 'spec_helper'

RSpec.describe NumRuby::UFunc::Rad2deg do
  describe '.call' do
    subject(:result) { described_class.call(x) }

    let(:x) { Numo::DFloat[0, Math::PI / 6, Math::PI / 4, Math::PI / 2, Math::PI] }

    it 'converts radians to degrees correctly' do
      expected = Numo::DFloat[0.0, 30.0, 45.0, 90.0, 180.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative angles correctly' do
      x_neg = Numo::DFloat[-Math::PI, -Math::PI / 2, -Math::PI / 4, -Math::PI / 6]
      result = described_class.call(x_neg)
      expected = Numo::DFloat[-180.0, -90.0, -45.0, -30.0]
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

    it 'matches manual calculation' do
      x_test = Numo::DFloat[1.0] # 1 radian
      result = described_class.call(x_test)
      expected = 1.0 * (180.0 / Math::PI)
      expect((result[0] - expected).abs).to be < 1e-14
    end
  end

  describe '.rad2deg' do
    subject(:result) { NumRuby.rad2deg(x) }

    let(:x) { Numo::DFloat[0, Math::PI / 6, Math::PI / 4, Math::PI / 2, Math::PI] }

    it 'converts radians to degrees correctly' do
      expected = Numo::DFloat[0.0, 30.0, 45.0, 90.0, 180.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles negative angles correctly' do
      x_neg = Numo::DFloat[-Math::PI, -Math::PI / 2, -Math::PI / 4, -Math::PI / 6]
      result = NumRuby.rad2deg(x_neg)
      expected = Numo::DFloat[-180.0, -90.0, -45.0, -30.0]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'is equivalent to degrees function' do
      x_test = Numo::DFloat[Math::PI / 4, Math::PI / 2, 3 * Math::PI / 4, 3 * Math::PI / 2]
      rad2deg_result = NumRuby.rad2deg(x_test)
      degrees_result = NumRuby.degrees(x_test)
      diff = (rad2deg_result - degrees_result).abs
      expect(diff.max).to be < 1e-14
    end

    it 'is inverse of deg2rad function' do
      x_test = Numo::DFloat[Math::PI / 6, Math::PI / 3, Math::PI / 2, Math::PI]
      degrees_result = NumRuby.rad2deg(x_test)
      radians_back = NumRuby.deg2rad(degrees_result)
      diff = (radians_back - x_test).abs
      expect(diff.max).to be < 1e-12
    end

    it 'handles common angles correctly' do
      common_radians = Numo::DFloat[
        Math::PI / 6,     # 30°
        Math::PI / 4,     # 45°
        Math::PI / 3,     # 60°
        Math::PI / 2,     # 90°
        2 * Math::PI / 3, # 120°
        3 * Math::PI / 4, # 135°
        5 * Math::PI / 6, # 150°
        Math::PI          # 180°
      ]
      result = NumRuby.rad2deg(common_radians)
      expected = Numo::DFloat[30, 45, 60, 90, 120, 135, 150, 180]
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end
end
