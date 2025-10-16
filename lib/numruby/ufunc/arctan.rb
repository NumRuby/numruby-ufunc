# NumRuby::UFunc::Arctan
#
# Human Name: Arc Tangent
# Description: Computes the elementwise arc tangent of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, 0, 1]
#   NumRuby.arctan(x)
#   # => Numo::DFloat[-PI/4, 0, PI/4]

module NumRuby
  module UFunc
    module Arctan
      def self.call(x)
        Numo::NMath.atan(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arctan, NumRuby::UFunc::Arctan)

module NumRuby
  def self.arctan(x)
    UFunc::Arctan.call(x)
  end
end
