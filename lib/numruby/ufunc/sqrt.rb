# NumRuby::UFunc::Sqrt
#
# Human Name: Square Root
# Description: Computes elementwise square root of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 4, 9]
#   NumRuby.sqrt(x)
#   # => Numo::DFloat[0, 2, 3]

module NumRuby
  module UFunc
    module Sqrt
      def self.call(x)
        Numo::NMath.sqrt(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sqrt, NumRuby::UFunc::Sqrt)

module NumRuby
  def self.sqrt(x)
    UFunc::Sqrt.call(x)
  end
end
