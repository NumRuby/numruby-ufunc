# NumRuby::UFunc::Cos
#
# Human Name: Cosine
# Description: Computes the elementwise cosine of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/2, Math::PI]
#   NumRuby.cos(x)
#   # => Numo::DFloat[1, 0, -1]

module NumRuby
  module UFunc
    module Cos
      def self.call(x)
        Numo::NMath.cos(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:cos, NumRuby::UFunc::Cos)

module NumRuby
  def self.cos(x)
    UFunc::Cos.call(x)
  end
end
