# NumRuby::UFunc::Pow
#
# Human Name: Power
# Description: Computes elementwise x**y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[2, 3, 4]
#   y = Numo::DFloat[3, 2, 1]
#   NumRuby.pow(x, y)
#   # => Numo::DFloat[8, 9, 4]

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

module NumRuby
  def self.pow(x, y)
    UFunc::Pow.call(x, y)
  end
end
