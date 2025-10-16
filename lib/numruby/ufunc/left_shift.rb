# NumRuby::UFunc::LeftShift
#
# Human Name: Left Shift
# Description: Shifts the bits of each element to the left.
# Type: Binary
#
# Example:
#   x = Numo::Int32[1, 5, 8, 16]
#   y = Numo::Int32[1, 2, 3, 1]
#   NumRuby.left_shift(x, y)
#   # => Numo::Int32[2, 20, 64, 32]

module NumRuby
  module UFunc
    module LeftShift
      def self.call(x, y)
        x << y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:left_shift, NumRuby::UFunc::LeftShift)

module NumRuby
  def self.left_shift(x, y)
    UFunc::LeftShift.call(x, y)
  end
end
