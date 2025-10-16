# NumRuby::UFunc::Exp
#
# Human Name: Exponential
# Description: Computes the elementwise exponential e**x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.exp(x)
#   # => Numo::DFloat[1, 2.718, 7.389]

module NumRuby
  module UFunc
    module Exp
      def self.call(x)
        Numo::NMath.exp(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:exp, NumRuby::UFunc::Exp)

module NumRuby
  def self.exp(x)
    UFunc::Exp.call(x)
  end
end
