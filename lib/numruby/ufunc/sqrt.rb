# NumRuby::UFunc::Sqrt
#
# Human Name: Square Root
# Description: Computes square root elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1,4,9]
#   NumRuby::UFunc::Sqrt.call(x)
module NumRuby
  module UFunc
    module Sqrt
      def self.call(x)
        Numo::NMath.sqrt(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sqrt, NumRuby::UFunc::Sqrt)
