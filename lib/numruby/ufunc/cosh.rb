# NumRuby::UFunc::Cosh
#
# Human Name: Hyperbolic Cosine
# Description: Computes the elementwise hyperbolic cosine of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.cosh(x)
#   # => Numo::DFloat[1, 1.543, 3.762]

module NumRuby
  module UFunc
    module Cosh
      def self.call(x)
        Numo::NMath.cosh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:cosh, NumRuby::UFunc::Cosh)

module NumRuby
  def self.cosh(x)
    UFunc::Cosh.call(x)
  end
end
