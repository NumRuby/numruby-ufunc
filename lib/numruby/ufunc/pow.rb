# NumRuby::UFunc::Pow
#
# Human Name: Power
# Description: Computes elementwise x^y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[2,3]
#   y = Numo::DFloat[3,2]
#   NumRuby::UFunc::Pow.call(x, y)
module NumRuby
  module UFunc
    module Pow
      def self.call(x, y)
        x ** y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:pow, NumRuby::UFunc::Pow)
