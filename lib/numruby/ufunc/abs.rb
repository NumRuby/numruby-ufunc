# NumRuby::UFunc::Absolute
#
# Human Name: Absolute Value
# Description: Computes the elementwise absolute value of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, -2, 3]
#   NumRuby.absolute(x)
#   # => Numo::DFloat[1, 2, 3]

module NumRuby
  module UFunc
    module Absolute
      def self.call(x)
        x.map(&:abs)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:absolute, NumRuby::UFunc::Absolute)

module NumRuby
  def self.absolute(x)
    UFunc::Absolute.call(x)
  end
end
