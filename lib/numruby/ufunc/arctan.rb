# NumRuby::UFunc::Arctan
#
# Human Name: Arctangent
# Description: Computes the inverse tangent elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, -1]
#   NumRuby::UFunc::Arctan.call(x)
module NumRuby
  module UFunc
    module Arctan
      def self.call(x)
        Numo::NMath.atan(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arctan, NumRuby::UFunc::Arctan)
