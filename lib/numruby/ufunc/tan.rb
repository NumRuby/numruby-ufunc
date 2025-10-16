# NumRuby::UFunc::Tan
#
# Human Name: Tangent
# Description: Computes elementwise tangent of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/4, Math::PI/2]
#   NumRuby.tan(x)
#   # => Numo::DFloat[0, 1, ∞]

module NumRuby
  module UFunc
    module Tan
      def self.call(x)
        Numo::NMath.tan(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:tan, NumRuby::UFunc::Tan)

module NumRuby
  def self.tan(x)
    UFunc::Tan.call(x)
  end
end
