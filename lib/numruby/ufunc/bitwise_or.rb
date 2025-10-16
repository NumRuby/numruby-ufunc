# NumRuby::UFunc::BitwiseOr
#
# Human Name: Bitwise OR
# Description: Performs bitwise OR operation on corresponding elements.
# Type: Binary
#
# Example:
#   x = Numo::Int32[5, 7, 15]
#   y = Numo::Int32[3, 5, 7]
#   NumRuby.bitwise_or(x, y)
#   # => Numo::Int32[7, 7, 15]

module NumRuby
  module UFunc
    module BitwiseOr
      def self.call(x, y)
        x | y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:bitwise_or, NumRuby::UFunc::BitwiseOr)

module NumRuby
  def self.bitwise_or(x, y)
    UFunc::BitwiseOr.call(x, y)
  end
end
