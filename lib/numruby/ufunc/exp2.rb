# NumRuby::UFunc::Exp2
#
# Human Name: Base-2 Exponential
# Description: Computes elementwise 2**x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.exp2(x)
#   # => Numo::DFloat[1, 2, 4]

module NumRuby
  module UFunc
    module Exp2
      def self.call(x)
        x.map { |a| 2 ** a }
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:exp2, NumRuby::UFunc::Exp2)

module NumRuby
  def self.exp2(x)
    UFunc::Exp2.call(x)
  end
end
