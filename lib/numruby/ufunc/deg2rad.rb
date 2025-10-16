# NumRuby::UFunc::Deg2rad
#
# Human Name: Degrees to radians
# Description: Converts angles from degrees to radians, element-wise.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 30, 45, 90, 180]
#   NumRuby.deg2rad(x)
#   # => Numo::DFloat[0.0, 0.5236, 0.7854, 1.5708, 3.1416]

module NumRuby
  module UFunc
    module Deg2rad
      def self.call(x)
        x * (Math::PI / 180.0)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:deg2rad, NumRuby::UFunc::Deg2rad)

module NumRuby
  def self.deg2rad(x)
    UFunc::Deg2rad.call(x)
  end
end
