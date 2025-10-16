# NumRuby::UFunc::Fabs
#
# Human Name: Absolute Value
# Description: Compute the absolute values element-wise.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-1, 2, -3, 4]
#   NumRuby.fabs(x)
#   # => Numo::DFloat[1.0, 2.0, 3.0, 4.0]

module NumRuby
  module UFunc
    module Fabs
      def self.call(x)
        x.abs
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:fabs, NumRuby::UFunc::Fabs)

module NumRuby
  def self.fabs(x)
    UFunc::Fabs.call(x)
  end
end
