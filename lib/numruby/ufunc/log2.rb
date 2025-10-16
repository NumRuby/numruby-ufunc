# NumRuby::UFunc::Log2
#
# Human Name: Base-2 Logarithm
# Description: Computes elementwise log2(x).
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 2, 4, 8]
#   NumRuby.log2(x)
#   # => Numo::DFloat[0, 1, 2, 3]

module NumRuby
  module UFunc
    module Log2
      def self.call(x)
        Numo::NMath.log(x) / Math.log(2)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log2, NumRuby::UFunc::Log2)

module NumRuby
  def self.log2(x)
    UFunc::Log2.call(x)
  end
end
