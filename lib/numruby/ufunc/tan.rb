# NumRuby::UFunc::Tan
#
# Human Name: Tangent
# Description: Computes tangent elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/4, Math::PI/2]
#   NumRuby::UFunc::Tan.call(x)
module NumRuby
  module UFunc
    module Tan
      def self.call(x)
        Numo::NMath.tan(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:tan, NumRuby::UFunc::Tan)
