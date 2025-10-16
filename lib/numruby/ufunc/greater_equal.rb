# NumRuby::UFunc::GreaterEqual
#
# Human Name: Greater Than or Equal
# Description: Checks if elements of one array are greater than or equal to the corresponding elements of another.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[3, 5, 1]
#   y = Numo::DFloat[2, 5, 2]
#   NumRuby.greater_equal(x, y)
#   # => Numo::Bit[1, 1, 0]

module NumRuby
  module UFunc
    module GreaterEqual
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a >= b ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:greater_equal, NumRuby::UFunc::GreaterEqual)

module NumRuby
  def self.greater_equal(x, y)
    UFunc::GreaterEqual.call(x, y)
  end
end
