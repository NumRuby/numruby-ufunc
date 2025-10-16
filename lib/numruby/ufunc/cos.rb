# NumRuby::UFunc::Cos
#
# Human Name: Cosine
# Description: Computes cosine elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/2, Math::PI]
#   NumRuby::UFunc::Cos.call(x)
module NumRuby
  module UFunc
    module Cos
      def self.call(x)
        Numo::NMath.cos(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:cos, NumRuby::UFunc::Cos)
