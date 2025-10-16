# NumRuby::UFunc::Logaddexp2
#
# Human Name: Log Addition Exponentiations Base2
# Description: Logarithm of the sum of exponentiations of the inputs in base-2.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   y = Numo::DFloat[4, 5, 6]
#   NumRuby.logaddexp2(x, y)
#   # => Numo::DFloat[4.0625, 5.0311, 6.0155]

module NumRuby
  module UFunc
    module Logaddexp2
      def self.call(x, y)
        Numo::NMath.log2(Numo::NMath.exp2(x) + Numo::NMath.exp2(y))
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:logaddexp2, NumRuby::UFunc::Logaddexp2)

module NumRuby
  def self.logaddexp2(x, y)
    UFunc::Logaddexp2.call(x, y)
  end
end
