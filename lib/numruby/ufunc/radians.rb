# NumRuby::UFunc::Radians
#
# Human Name: Degrees to Radians
# Description: Converts angles from degrees to radians.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 30, 45, 90, 180]
#   NumRuby.radians(x)
#   # => Numo::DFloat[0.0, 0.5236, 0.7854, 1.5708, 3.1416]

module NumRuby
  module UFunc
    module Radians
      def self.call(x)
        x * (Math::PI / 180.0)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:radians, NumRuby::UFunc::Radians)

module NumRuby
  def self.radians(x)
    UFunc::Radians.call(x)
  end
end
