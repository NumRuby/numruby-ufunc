# NumRuby::UFunc::Sinh
#
# Human Name: Hyperbolic Sine
# Description: Computes hyperbolic sine elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0,1,2]
#   NumRuby::UFunc::Sinh.call(x)
module NumRuby
  module UFunc
    module Sinh
      def self.call(x)
        Numo::NMath.sinh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sinh, NumRuby::UFunc::Sinh)
