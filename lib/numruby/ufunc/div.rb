# NumRuby::UFunc::Div
#
# Human Name: Division
# Description: Computes elementwise division of x by y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[6, 8, 10]
#   y = Numo::DFloat[2, 4, 5]
#   NumRuby.div(x, y)
#   # => Numo::DFloat[3, 2, 2]

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

module NumRuby
  def self.div(x, y)
    UFunc::Div.call(x, y)
  end
end
