require 'spec_helper'

RSpec.describe NumRuby::UFunc::Arctan2 do
  describe '.call' do
    subject(:result) { described_class.call(y, x) }

    let(:y) { Numo::DFloat[1, 1, -1, -1] }
    let(:x) { Numo::DFloat[1, -1, -1, 1] }

    it 'computes arctan2 of two arrays correctly' do
      expected = Numo::NMath.atan2(y, x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'preserves quadrant information correctly' do
      # Test all four quadrants
      y_quad = Numo::DFloat[1, 1, -1, -1]
      x_quad = Numo::DFloat[1, -1, -1, 1]
      result = described_class.call(y_quad, x_quad)

      # First quadrant: positive result
      expect(result[0]).to be > 0
      expect(result[0]).to be < Math::PI / 2

      # Second quadrant: positive result > π/2
      expect(result[1]).to be > Math::PI / 2
      expect(result[1]).to be < Math::PI

      # Third quadrant: negative result < -π/2
      expect(result[2]).to be < -Math::PI / 2
      expect(result[2]).to be > -Math::PI

      # Fourth quadrant: negative result > -π/2
      expect(result[3]).to be < 0
      expect(result[3]).to be > -Math::PI / 2
    end

    it 'handles edge cases correctly' do
      # Test zero cases
      y_zero = Numo::DFloat[0, 0, 1, -1]
      x_zero = Numo::DFloat[1, -1, 0, 0]
      result = described_class.call(y_zero, x_zero)

      expected = Numo::NMath.atan2(y_zero, x_zero)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end
  end

  describe '.arctan2' do
    subject(:result) { NumRuby.arctan2(y, x) }

    let(:y) { Numo::DFloat[1, 1, -1, -1] }
    let(:x) { Numo::DFloat[1, -1, -1, 1] }

    it 'computes arctan2 of two arrays correctly' do
      expected = Numo::NMath.atan2(y, x)
      diff = (result - expected).abs
      expect(diff.max).to be < 1e-12
    end

    it 'preserves quadrant information correctly' do
      # Test all four quadrants
      y_quad = Numo::DFloat[1, 1, -1, -1]
      x_quad = Numo::DFloat[1, -1, -1, 1]
      result = NumRuby.arctan2(y_quad, x_quad)

      # First quadrant: positive result
      expect(result[0]).to be > 0
      expect(result[0]).to be < Math::PI / 2

      # Second quadrant: positive result > π/2
      expect(result[1]).to be > Math::PI / 2
      expect(result[1]).to be < Math::PI

      # Third quadrant: negative result < -π/2
      expect(result[2]).to be < -Math::PI / 2
      expect(result[2]).to be > -Math::PI

      # Fourth quadrant: negative result > -π/2
      expect(result[3]).to be < 0
      expect(result[3]).to be > -Math::PI / 2
    end
  end
end
