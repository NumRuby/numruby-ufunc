# NumRuby::UFunc::Arcsinh
#
# Human Name: Inverse Hyperbolic Sine
# Description: Computes the inverse hyperbolic sine of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2, 3]
#   NumRuby.arcsinh(x)
#   # => Numo::DFloat[0.0, 0.8814, 1.4436, 1.8185]

module NumRuby
  module UFunc
    module Arcsinh
      def self.call(x)
        Numo::NMath.asinh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arcsinh, NumRuby::UFunc::Arcsinh)

module NumRuby
  def self.arcsinh(x)
    UFunc::Arcsinh.call(x)
  end
end
