# NumRuby::UFunc::LogicalOr
#
# Human Name: Logical OR
# Description: Performs element-wise logical OR operation.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 0, 0]
#   y = Numo::DFloat[0, 1, 0]
#   NumRuby.logical_or(x, y)
#   # => Numo::Bit[1, 1, 0]

module NumRuby
  module UFunc
    module LogicalOr
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a != 0 || b != 0 ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:logical_or, NumRuby::UFunc::LogicalOr)

module NumRuby
  def self.logical_or(x, y)
    UFunc::LogicalOr.call(x, y)
  end
end
