# NumRuby::UFunc::Cbrt
#
# Human Name: Cube Root
# Description: Computes the cube root of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 8, 27, 64]
#   NumRuby.cbrt(x)
#   # => Numo::DFloat[1.0, 2.0, 3.0, 4.0]

module NumRuby
  module UFunc
    module Cbrt
      def self.call(x)
        # Use a more precise approach for cube root
        result = x**(1.0 / 3.0)

        # For negative numbers, handle the sign properly
        negative_mask = x < 0
        result[negative_mask] = -((-x[negative_mask])**(1.0 / 3.0))

        result
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:cbrt, NumRuby::UFunc::Cbrt)

module NumRuby
  def self.cbrt(x)
    UFunc::Cbrt.call(x)
  end
end
