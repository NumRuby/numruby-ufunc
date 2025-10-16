# NumRuby::UFunc::BitwiseXor
#
# Human Name: Bitwise XOR
# Description: Performs bitwise XOR operation on corresponding elements.
# Type: Binary
#
# Example:
#   x = Numo::Int32[5, 7, 15]
#   y = Numo::Int32[3, 5, 7]
#   NumRuby.bitwise_xor(x, y)
#   # => Numo::Int32[6, 2, 8]

module NumRuby
  module UFunc
    module BitwiseXor
      def self.call(x, y)
        x ^ y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:bitwise_xor, NumRuby::UFunc::BitwiseXor)

module NumRuby
  def self.bitwise_xor(x, y)
    UFunc::BitwiseXor.call(x, y)
  end
end
