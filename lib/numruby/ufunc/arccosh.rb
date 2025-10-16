# NumRuby::UFunc::Arccosh
#
# Human Name: Inverse Hyperbolic Cosine
# Description: Computes the inverse hyperbolic cosine of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 2, 3, 4]
#   NumRuby.arccosh(x)
#   # => Numo::DFloat[0.0, 1.3170, 1.7627, 2.0634]

module NumRuby
  module UFunc
    module Arccosh
      def self.call(x)
        Numo::NMath.acosh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arccosh, NumRuby::UFunc::Arccosh)

module NumRuby
  def self.arccosh(x)
    UFunc::Arccosh.call(x)
  end
end
