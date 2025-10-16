# NumRuby::UFunc::BitwiseAnd
#
# Human Name: Bitwise AND
# Description: Performs bitwise AND operation on corresponding elements.
# Type: Binary
#
# Example:
#   x = Numo::Int32[5, 7, 15]
#   y = Numo::Int32[3, 5, 7]
#   NumRuby.bitwise_and(x, y)
#   # => Numo::Int32[1, 5, 7]

module NumRuby
  module UFunc
    module BitwiseAnd
      def self.call(x, y)
        x & y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:bitwise_and, NumRuby::UFunc::BitwiseAnd)

module NumRuby
  def self.bitwise_and(x, y)
    UFunc::BitwiseAnd.call(x, y)
  end
end
