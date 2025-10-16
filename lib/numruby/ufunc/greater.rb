# NumRuby::UFunc::Greater
#
# Human Name: Greater Than
# Description: Checks if elements of one array are greater than the corresponding elements of another.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[3, 5, 1]
#   y = Numo::DFloat[2, 5, 2]
#   NumRuby.greater(x, y)
#   # => Numo::Bit[1, 0, 0]

module NumRuby
  module UFunc
    module Greater
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a > b ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:greater, NumRuby::UFunc::Greater)

module NumRuby
  def self.greater(x, y)
    UFunc::Greater.call(x, y)
  end
end
