# NumRuby::UFunc::Reciprocal
#
# Human Name: Reciprocal
# Description: Computes the reciprocal (1/x) of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 2, 4, 8]
#   NumRuby.reciprocal(x)
#   # => Numo::DFloat[1.0, 0.5, 0.25, 0.125]

module NumRuby
  module UFunc
    module Reciprocal
      def self.call(x)
        1.0 / x
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:reciprocal, NumRuby::UFunc::Reciprocal)

module NumRuby
  def self.reciprocal(x)
    UFunc::Reciprocal.call(x)
  end
end
