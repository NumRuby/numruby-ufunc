# NumRuby::UFunc::Ceil
#
# Human Name: Ceiling
# Description: Rounds each element of x up to the nearest integer.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.2, 2.5, -1.7]
#   NumRuby::UFunc::Ceil.call(x)
#   # => Numo::DFloat[2,3,-1]
module NumRuby
  module UFunc
    module Ceil
      def self.call(x)
        x.map(&:ceil)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:ceil, NumRuby::UFunc::Ceil)
