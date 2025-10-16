# NumRuby::UFunc::Sinh
#
# Human Name: Hyperbolic Sine
# Description: Computes the elementwise hyperbolic sine of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.sinh(x)
#   # => Numo::DFloat[0, 1.175, 3.627]

module NumRuby
  module UFunc
    module Sinh
      def self.call(x)
        Numo::NMath.sinh(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sinh, NumRuby::UFunc::Sinh)

module NumRuby
  def self.sinh(x)
    UFunc::Sinh.call(x)
  end
end
