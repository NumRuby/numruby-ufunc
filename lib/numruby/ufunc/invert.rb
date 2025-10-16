# NumRuby::UFunc::Invert
#
# Human Name: Bitwise NOT
# Description: Performs bitwise NOT operation on each element. alias: bitwise_not
# Type: Unary
#
# Example:
#   x = Numo::Int32[5, 7, 15]
#   NumRuby.invert(x)
#   # => Numo::Int32[-6, -8, -16]

module NumRuby
  module UFunc
    module Invert
      def self.call(x)
        ~x
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:invert, NumRuby::UFunc::Invert)

module NumRuby
  def self.invert(x)
    UFunc::Invert.call(x)
  end
end
