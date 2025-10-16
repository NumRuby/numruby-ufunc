# NumRuby::UFunc::LogicalXor
#
# Human Name: Logical XOR
# Description: Performs element-wise logical XOR operation.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 0, 1]
#   y = Numo::DFloat[0, 1, 1]
#   NumRuby.logical_xor(x, y)
#   # => Numo::Bit[1, 1, 0]

module NumRuby
  module UFunc
    module LogicalXor
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| (a != 0) ^ (b != 0) ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:logical_xor, NumRuby::UFunc::LogicalXor)

module NumRuby
  def self.logical_xor(x, y)
    UFunc::LogicalXor.call(x, y)
  end
end
