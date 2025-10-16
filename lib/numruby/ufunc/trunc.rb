# NumRuby::UFunc::Trunc
#
# Human Name: Truncate
# Description: Truncates each element of x toward zero.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.7, -2.8, 3.5]
#   NumRuby.trunc(x)
#   # => Numo::DFloat[1, -2, 3]

module NumRuby
  module UFunc
    module Trunc
      def self.call(x)
        x.map(&:truncate)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:trunc, NumRuby::UFunc::Trunc)

module NumRuby
  def self.trunc(x)
    UFunc::Trunc.call(x)
  end
end
