# NumRuby::UFunc::Rad2deg
#
# Human Name: Radians to degrees
# Description: Converts angles from radians to degrees, element-wise.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/6, Math::PI/4, Math::PI/2, Math::PI]
#   NumRuby.rad2deg(x)
#   # => Numo::DFloat[0.0, 30.0, 45.0, 90.0, 180.0]

module NumRuby
  module UFunc
    module Rad2deg
      def self.call(x)
        x * (180.0 / Math::PI)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:rad2deg, NumRuby::UFunc::Rad2deg)

module NumRuby
  def self.rad2deg(x)
    UFunc::Rad2deg.call(x)
  end
end
