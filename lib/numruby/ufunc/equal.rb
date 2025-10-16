# NumRuby::UFunc::Equal
#
# Human Name: Equal
# Description: Checks element-wise equality between two arrays.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 5, 3]
#   y = Numo::DFloat[2, 5, 3]
#   NumRuby.equal(x, y)
#   # => Numo::Bit[0, 1, 1]

module NumRuby
  module UFunc
    module Equal
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a == b ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:equal, NumRuby::UFunc::Equal)

module NumRuby
  def self.equal(x, y)
    UFunc::Equal.call(x, y)
  end
end
