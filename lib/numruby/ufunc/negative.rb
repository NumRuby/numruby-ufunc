# NumRuby::UFunc::Negative
#
# Human Name: Negation
# Description: Negates each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, -2, 3]
#   NumRuby.negative(x)
#   # => Numo::DFloat[-1, 2, -3]

module NumRuby
  module UFunc
    module Negative
      def self.call(x)
        -x
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:negative, NumRuby::UFunc::Negative)

module NumRuby
  def self.negative(x)
    UFunc::Negative.call(x)
  end
end
