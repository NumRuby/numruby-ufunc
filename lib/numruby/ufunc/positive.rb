# NumRuby::UFunc::Positive
#
# Human Name: Positive
# Description: Numerical positive, element-wise.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, -2, 3]
#   NumRuby.positive(x)
#   # => Numo::DFloat[1, -2, 3]

module NumRuby
  module UFunc
    module Positive
      def self.call(x)
        x
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:positive, NumRuby::UFunc::Positive)

module NumRuby
  def self.positive(x)
    UFunc::Positive.call(x)
  end
end
