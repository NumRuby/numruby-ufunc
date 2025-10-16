# NumRuby::UFunc::Expm1
#
# Human Name: Exponential Minus One
# Description: Computes e^x - 1 for each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.expm1(x)
#   # => Numo::DFloat[0.0, 1.718, 6.389]

module NumRuby
  module UFunc
    module Expm1
      def self.call(x)
        Numo::NMath.exp(x) - 1
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:expm1, NumRuby::UFunc::Expm1)

module NumRuby
  def self.expm1(x)
    UFunc::Expm1.call(x)
  end
end
