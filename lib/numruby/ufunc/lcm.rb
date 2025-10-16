# NumRuby::UFunc::Lcm
#
# Human Name: Lowest Common Multiple
# Description: Returns the lowest common multiple of |x1| and |x2|.
# Type: Binary
#
# Example:
#   x = Numo::Int32[4, 6, 8]
#   y = Numo::Int32[6, 8, 12]
#   NumRuby.lcm(x, y)
#   # => Numo::Int32[12, 24, 24]

module NumRuby
  module UFunc
    module Lcm
      def self.call(x, y)
        # Convert to integer arrays for LCM calculation
        x_int = x.cast_to(Numo::Int32)
        y_int = y.cast_to(Numo::Int32)

        result = Numo::Int32.zeros(*x.shape)

        x_int.flatten.each_with_index do |x_val, i|
          y_val = y_int.flatten[i]
          # LCM(a,b) = |a*b| / GCD(a,b)
          # Handle zero case: LCM(0, n) = 0
          result.flatten[i] = if x_val.zero? || y_val.zero?
                                0
                              else
                                (x_val.abs * y_val.abs) / x_val.abs.gcd(y_val.abs)
                              end
        end

        result
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:lcm, NumRuby::UFunc::Lcm)

module NumRuby
  def self.lcm(x, y)
    UFunc::Lcm.call(x, y)
  end
end
