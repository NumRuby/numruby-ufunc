# NumRuby::UFunc::LogicalNot
#
# Human Name: Logical NOT
# Description: Performs element-wise logical NOT operation.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 0, 2]
#   NumRuby.logical_not(x)
#   # => Numo::Bit[0, 1, 0]

module NumRuby
  module UFunc
    module LogicalNot
      def self.call(x)
        Numo::Bit.cast(x.to_a.map { |a| a.zero? ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:logical_not, NumRuby::UFunc::LogicalNot)

module NumRuby
  def self.logical_not(x)
    UFunc::LogicalNot.call(x)
  end
end
