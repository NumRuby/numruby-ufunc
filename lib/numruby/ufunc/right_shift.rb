# NumRuby::UFunc::RightShift
#
# Human Name: Right Shift
# Description: Shifts the bits of each element to the right.
# Type: Binary
#
# Example:
#   x = Numo::Int32[8, 20, 64, 32]
#   y = Numo::Int32[1, 2, 3, 1]
#   NumRuby.right_shift(x, y)
#   # => Numo::Int32[4, 5, 8, 16]

module NumRuby
  module UFunc
    module RightShift
      def self.call(x, y)
        x >> y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:right_shift, NumRuby::UFunc::RightShift)

module NumRuby
  def self.right_shift(x, y)
    UFunc::RightShift.call(x, y)
  end
end
