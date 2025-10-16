# NumRuby::UFunc::TrueDivide
#
# Human Name: True Division
# Description: Divides corresponding elements of two arrays, returning float results.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   y = Numo::DFloat[4, 5, 6]
#   NumRuby.true_divide(x, y)
#   # => Numo::DFloat[0.25, 0.4, 0.5]

module NumRuby
  module UFunc
    module TrueDivide
      def self.call(x, y)
        x.cast_to(Numo::DFloat) / y.cast_to(Numo::DFloat)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:true_divide, NumRuby::UFunc::TrueDivide)

module NumRuby
  def self.true_divide(x, y)
    UFunc::TrueDivide.call(x, y)
  end
end
