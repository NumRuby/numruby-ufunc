# NumRuby::UFunc::Hypot
#
# Human Name: Hypotenuse
# Description: Computes sqrt(x^2 + y^2) elementwise.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[3,5]
#   y = Numo::DFloat[4,12]
#   NumRuby::UFunc::Hypot.call(x, y)
#   # => Numo::DFloat[5,13]
module NumRuby
  module UFunc
    module Hypot
      def self.call(x, y)
        Numo::DFloat[x.to_a.zip(y.to_a).map { |a, b| Math.sqrt(a**2 + b**2) }]
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:hypot, NumRuby::UFunc::Hypot)
