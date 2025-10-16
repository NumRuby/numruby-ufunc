# NumRuby::UFunc::Logaddexp
#
# Human Name: Log Addition Exponentiations
# Description: Logarithm of the sum of exponentiations of the inputs.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   y = Numo::DFloat[4, 5, 6]
#   NumRuby.logaddexp(x, y)
#   # => Numo::DFloat[4.0486, 5.0067, 6.0024]

module NumRuby
  module UFunc
    module Logaddexp
      def self.call(x, y)
        Numo::NMath.log(Numo::NMath.exp(x) + Numo::NMath.exp(y))
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:logaddexp, NumRuby::UFunc::Logaddexp)

module NumRuby
  def self.logaddexp(x, y)
    UFunc::Logaddexp.call(x, y)
  end
end
