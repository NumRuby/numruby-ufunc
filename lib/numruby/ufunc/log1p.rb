# NumRuby::UFunc::Log1p
#
# Human Name: Logarithm of One Plus
# Description: Computes log(1 + x) for each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, 1, 2]
#   NumRuby.log1p(x)
#   # => Numo::DFloat[0.0, 0.693, 1.099]

module NumRuby
  module UFunc
    module Log1p
      def self.call(x)
        Numo::NMath.log(1 + x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log1p, NumRuby::UFunc::Log1p)

module NumRuby
  def self.log1p(x)
    UFunc::Log1p.call(x)
  end
end
