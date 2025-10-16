# NumRuby::UFunc::Remainder
#
# Human Name: Remainder
# Description: Computes the remainder of division for each element.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[7, 8, 9]
#   y = Numo::DFloat[2, 3, 4]
#   NumRuby.remainder(x, y)
#   # => Numo::DFloat[1.0, 2.0, 1.0]

module NumRuby
  module UFunc
    module Remainder
      def self.call(x, y)
        x % y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:remainder, NumRuby::UFunc::Remainder)

module NumRuby
  def self.remainder(x, y)
    UFunc::Remainder.call(x, y)
  end
end
