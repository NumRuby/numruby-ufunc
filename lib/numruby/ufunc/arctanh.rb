# NumRuby::UFunc::Arctanh
#
# Human Name: Inverse Hyperbolic Tangent
# Description: Computes the inverse hyperbolic tangent of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 0.5, 0.8, 0.9]
#   NumRuby.arctanh(x)
#   # => Numo::DFloat[0.0, 0.5493, 1.0986, 1.4722]

module NumRuby
  module UFunc
    module Arctanh
      def self.call(x)
        Numo::NMath.atanh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arctanh, NumRuby::UFunc::Arctanh)

module NumRuby
  def self.arctanh(x)
    UFunc::Arctanh.call(x)
  end
end
