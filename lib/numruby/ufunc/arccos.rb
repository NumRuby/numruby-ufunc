# NumRuby::UFunc::Arccos
#
# Human Name: Arc Cosine
# Description: Computes the elementwise arc cosine of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, 0, 1]
#   NumRuby.arccos(x)
#   # => Numo::DFloat[PI, PI/2, 0]

module NumRuby
  module UFunc
    module Arccos
      def self.call(x)
        Numo::NMath.acos(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:arccos, NumRuby::UFunc::Arccos)

module NumRuby
  def self.arccos(x)
    UFunc::Arccos.call(x)
  end
end
