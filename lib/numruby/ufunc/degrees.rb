# NumRuby::UFunc::Degrees
#
# Human Name: Radians to degrees
# Description: Converts angles from radians to degrees, element-wise. Equivalent to `x * 180 / π`.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/6, Math::PI/4, Math::PI/2, Math::PI]
#   NumRuby.degrees(x)
#   # => Numo::DFloat[0.0, 30.0, 45.0, 90.0, 180.0]

module NumRuby
  module UFunc
    module Degrees
      def self.call(x)
        x * (180.0 / Math::PI)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:degrees, NumRuby::UFunc::Degrees)

module NumRuby
  def self.degrees(x)
    UFunc::Degrees.call(x)
  end
end
