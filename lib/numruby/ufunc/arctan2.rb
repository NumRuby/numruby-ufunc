# NumRuby::UFunc::Arctan2
#
# Human Name: Two Argument Arctangent
# Description: Computes the angle between the x-axis and the vector (x, y), preserving quadrant information.
# Type: Binary
#
# Example:
#   y = Numo::DFloat[1, 1, -1, -1]
#   x = Numo::DFloat[1, -1, -1, 1]
#   NumRuby.arctan2(y, x)
#   # => Numo::DFloat[0.7854, 2.3562, -2.3562, -0.7854]

module NumRuby
  module UFunc
    module Arctan2
      def self.call(y, x)
        Numo::NMath.atan2(y, x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arctan2, NumRuby::UFunc::Arctan2)

module NumRuby
  def self.arctan2(y, x)
    UFunc::Arctan2.call(y, x)
  end
end
