# NumRuby::UFunc::Exp
#
# Human Name: Exponential
# Description: Computes e^x elementwise.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0,1,2]
#   NumRuby::UFunc::Exp.call(x)
module NumRuby
  module UFunc
    module Exp
      def self.call(x)
        Numo::NMath.exp(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:exp, NumRuby::UFunc::Exp)
