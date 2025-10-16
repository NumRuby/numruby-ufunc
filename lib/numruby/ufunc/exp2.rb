# NumRuby::UFunc::Exp2
#
# Human Name: 2 to the Power
# Description: Computes 2^x elementwise.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0,1,2]
#   NumRuby::UFunc::Exp2.call(x)
module NumRuby
  module UFunc
    module Exp2
      def self.call(x)
        x.map { |a| 2 ** a }
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:exp2, NumRuby::UFunc::Exp2)
