# NumRuby::UFunc::Gcd
#
# Human Name: Greatest Common Divisor
# Description: Returns the greatest common divisor of |x1| and |x2|.
# Type: Binary
#
# Example:
#   x = Numo::Int32[12, 18, 24]
#   y = Numo::Int32[8, 12, 16]
#   NumRuby.gcd(x, y)
#   # => Numo::Int32[4, 6, 8]

module NumRuby
  module UFunc
    module Gcd
      def self.call(x, y)
        # Convert to integer arrays for GCD calculation
        x_int = x.cast_to(Numo::Int32)
        y_int = y.cast_to(Numo::Int32)

        result = Numo::Int32.zeros(*x.shape)

        x_int.flatten.each_with_index do |x_val, i|
          y_val = y_int.flatten[i]
          result.flatten[i] = x_val.abs.gcd(y_val.abs)
        end

        result
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:gcd, NumRuby::UFunc::Gcd)

module NumRuby
  def self.gcd(x, y)
    UFunc::Gcd.call(x, y)
  end
end
