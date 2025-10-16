# NumRuby::UFunc::LogicalAnd
#
# Human Name: Logical AND
# Description: Performs element-wise logical AND operation.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 0, 1]
#   y = Numo::DFloat[1, 1, 0]
#   NumRuby.logical_and(x, y)
#   # => Numo::Bit[1, 0, 0]

module NumRuby
  module UFunc
    module LogicalAnd
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a != 0 && b != 0 ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:logical_and, NumRuby::UFunc::LogicalAnd)

module NumRuby
  def self.logical_and(x, y)
    UFunc::LogicalAnd.call(x, y)
  end
end
