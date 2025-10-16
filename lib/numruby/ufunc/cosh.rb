# NumRuby::UFunc::Cosh
#
# Human Name: Hyperbolic Cosine
# Description: Computes hyperbolic cosine elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0,1,2]
#   NumRuby::UFunc::Cosh.call(x)
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
