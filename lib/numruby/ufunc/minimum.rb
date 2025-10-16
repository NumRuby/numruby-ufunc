# NumRuby::UFunc::Minimum
#
# Human Name: Minimum
# Description: Computes elementwise minimum of x and y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1,5,3]
#   y = Numo::DFloat[2,2,4]
#   NumRuby::UFunc::Minimum.call(x, y)
module NumRuby
  module UFunc
    module Minimum
      def self.call(x, y)
        Numo::DFloat[x.to_a.zip(y.to_a).map { |a, b| a < b ? a : b }]
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:minimum, NumRuby::UFunc::Minimum)
