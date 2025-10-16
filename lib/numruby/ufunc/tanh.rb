# NumRuby::UFunc::Tanh
#
# Human Name: Hyperbolic Tangent
# Description: Computes hyperbolic tangent elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0,1,2]
#   NumRuby::UFunc::Tanh.call(x)
module NumRuby
  module UFunc
    module Tanh
      def self.call(x)
        Numo::NMath.tanh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:tanh, NumRuby::UFunc::Tanh)
