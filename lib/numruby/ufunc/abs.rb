# NumRuby::UFunc::Abs
#
# Human Name: Absolute Value
# Description: Computes the absolute value of each element in x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, -2, 3]
#   NumRuby::UFunc::Abs.call(x)
#   # => Numo::DFloat[1,2,3]
module NumRuby
  module UFunc
    module Abs
      def self.call(x)
        x.map(&:abs)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:abs, NumRuby::UFunc::Abs)
