# NumRuby::UFunc::Minimum
#
# Human Name: Minimum
# Description: Computes elementwise minimum of x and y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 4, 3]
#   y = Numo::DFloat[2, 2, 5]
#   NumRuby.minimum(x, y)
#   # => Numo::DFloat[1, 2, 3]

module NumRuby
  module UFunc
    module Minimum
      def self.call(x, y)
        Numo::DFloat[x.to_a.zip(y.to_a).map { |a, b| [a, b].min }]
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:minimum, NumRuby::UFunc::Minimum)

module NumRuby
  def self.minimum(x, y)
    UFunc::Minimum.call(x, y)
  end
end
