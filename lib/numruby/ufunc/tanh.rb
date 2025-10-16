# NumRuby::UFunc::Tanh
#
# Human Name: Hyperbolic Tangent
# Description: Computes elementwise hyperbolic tangent of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.tanh(x)
#   # => Numo::DFloat[0, 0.761, 0.964]

module NumRuby
  module UFunc
    module Tanh
      def self.call(x)
        Numo::NMath.tanh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:tanh, NumRuby::UFunc::Tanh)

module NumRuby
  def self.tanh(x)
    UFunc::Tanh.call(x)
  end
end
