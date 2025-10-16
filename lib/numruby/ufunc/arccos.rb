# NumRuby::UFunc::Arccos
#
# Human Name: Arccosine
# Description: Computes the inverse cosine elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 0.5, 1]
#   NumRuby::UFunc::Arccos.call(x)
module NumRuby
  module UFunc
    module Arccos
      def self.call(x)
        Numo::NMath.acos(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arccos, NumRuby::UFunc::Arccos)
