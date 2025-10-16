# NumRuby::UFunc::Div
#
# Human Name: Division
# Description: Computes elementwise division x / y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[4,6,8]
#   y = Numo::DFloat[2,3,2]
#   NumRuby::UFunc::Div.call(x, y)
#   # => Numo::DFloat[2,2,4]
module NumRuby
  module UFunc
    module Div
      def self.call(x, y)
        x / y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:div, NumRuby::UFunc::Div)
