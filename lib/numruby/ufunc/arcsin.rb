# NumRuby::UFunc::Arcsin
#
# Human Name: Arc Sine
# Description: Computes the elementwise arc sine of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, 0, 1]
#   NumRuby.arcsin(x)
#   # => Numo::DFloat[-PI/2, 0, PI/2]

module NumRuby
  module UFunc
    module Arcsin
      def self.call(x)
        Numo::NMath.asin(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arcsin, NumRuby::UFunc::Arcsin)

module NumRuby
  def self.arcsin(x)
    UFunc::Arcsin.call(x)
  end
end
