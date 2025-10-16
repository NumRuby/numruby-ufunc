# NumRuby::UFunc::NotEqual
#
# Human Name: Not Equal
# Description: Checks element-wise inequality between two arrays.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 5, 3]
#   y = Numo::DFloat[2, 5, 2]
#   NumRuby.not_equal(x, y)
#   # => Numo::Bit[1, 0, 1]

module NumRuby
  module UFunc
    module NotEqual
      def self.call(x, y)
        Numo::Bit.cast(x.to_a.zip(y.to_a).map { |a, b| a == b ? 0 : 1 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:not_equal, NumRuby::UFunc::NotEqual)

module NumRuby
  def self.not_equal(x, y)
    UFunc::NotEqual.call(x, y)
  end
end
