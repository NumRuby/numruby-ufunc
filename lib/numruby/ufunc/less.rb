# NumRuby::UFunc::Less
#
# Human Name: Less Than
# Description: Checks if elements of one array are less than the corresponding elements of another.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 5, 3]
#   y = Numo::DFloat[2, 5, 2]
#   NumRuby.less(x, y)
#   # => Numo::Bit[1, 0, 0]

module NumRuby
  module UFunc
    module Less
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a < b ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:less, NumRuby::UFunc::Less)

module NumRuby
  def self.less(x, y)
    UFunc::Less.call(x, y)
  end
end
