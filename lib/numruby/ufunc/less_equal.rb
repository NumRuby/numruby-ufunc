# NumRuby::UFunc::LessEqual
#
# Human Name: Less Than or Equal
# Description: Checks if elements of one array are less than or equal to the corresponding elements of another.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 5, 3]
#   y = Numo::DFloat[2, 5, 2]
#   NumRuby.less_equal(x, y)
#   # => Numo::Bit[1, 1, 0]

module NumRuby
  module UFunc
    module LessEqual
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a <= b ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:less_equal, NumRuby::UFunc::LessEqual)

module NumRuby
  def self.less_equal(x, y)
    UFunc::LessEqual.call(x, y)
  end
end
