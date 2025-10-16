# NumRuby::UFunc::Hypot
#
# Human Name: Hypotenuse
# Description: Computes elementwise sqrt(x**2 + y**2).
# Type: Binary
#
# Example:
#   x = Numo::DFloat[3, 5]
#   y = Numo::DFloat[4, 12]
#   NumRuby.hypot(x, y)
#   # => Numo::DFloat[5, 13]

module NumRuby
  module UFunc
    module Hypot
      def self.call(x, y)
        Numo::DFloat[x.to_a.zip(y.to_a).map { |a, b| Math.sqrt((a**2) + (b**2)) }]
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:hypot, NumRuby::UFunc::Hypot)

module NumRuby
  def self.hypot(x, y)
    UFunc::Hypot.call(x, y)
  end
end
