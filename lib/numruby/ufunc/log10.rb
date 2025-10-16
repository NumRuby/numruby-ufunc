# NumRuby::UFunc::Log10
#
# Human Name: Base-10 Logarithm
# Description: Computes elementwise log10(x).
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 10, 100]
#   NumRuby.log10(x)
#   # => Numo::DFloat[0, 1, 2]

module NumRuby
  module UFunc
    module Log10
      def self.call(x)
        Numo::NMath.log10(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log10, NumRuby::UFunc::Log10)

module NumRuby
  def self.log10(x)
    UFunc::Log10.call(x)
  end
end
