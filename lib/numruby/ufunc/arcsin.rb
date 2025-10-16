# NumRuby::UFunc::Arcsin
#
# Human Name: Arcsine
# Description: Computes the inverse sine elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 0.5, 1]
#   NumRuby::UFunc::Arcsin.call(x)
module NumRuby
  module UFunc
    module Arcsin
      def self.call(x)
        Numo::NMath.asin(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arcsin, NumRuby::UFunc::Arcsin)
