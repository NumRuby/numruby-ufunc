# NumRuby::UFunc::Mul
#
# Human Name: Multiplication
# Description: Computes elementwise product of x and y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   y = Numo::DFloat[4, 5, 6]
#   NumRuby.mul(x, y)
#   # => Numo::DFloat[4, 10, 18]

module NumRuby
  module UFunc
    module Mul
      def self.call(x, y)
        x * y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:mul, NumRuby::UFunc::Mul)

module NumRuby
  def self.mul(x, y)
    UFunc::Mul.call(x, y)
  end
end
