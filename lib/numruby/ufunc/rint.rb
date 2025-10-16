# NumRuby::UFunc::Rint
#
# Human Name: Rint
# Description: Rounds each element of x to the nearest integer.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.2, 2.8, -1.7]
#   NumRuby.rint(x)
#   # => Numo::DFloat[1, 3, -2]

module NumRuby
  module UFunc
    module Rint
      def self.call(x)
        x.map(&:round)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:rint, NumRuby::UFunc::Rint)

module NumRuby
  def self.rint(x)
    UFunc::Rint.call(x)
  end
end
