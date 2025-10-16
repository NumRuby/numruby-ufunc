# NumRuby::UFunc::Subtract
#
# Human Name: Subtraction
# Description: Computes elementwise difference x - y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[5, 7, 9]
#   y = Numo::DFloat[2, 3, 4]
#   NumRuby.subtract(x, y)
#   # => Numo::DFloat[3, 4, 5]

module NumRuby
  module UFunc
    module Subtract
      def self.call(x, y)
        x - y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:subtract, NumRuby::UFunc::Subtract)

module NumRuby
  def self.subtract(x, y)
    UFunc::Subtract.call(x, y)
  end
end
