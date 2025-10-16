# NumRuby::UFunc::Abs
#
# Human Name: Absolute Value
# Description: Computes the elementwise absolute value of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, -2, 3]
#   NumRuby.abs(x)
#   # => Numo::DFloat[1, 2, 3]

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

module NumRuby
  def self.abs(x)
    UFunc::Abs.call(x)
  end
end
