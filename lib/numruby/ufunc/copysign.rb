# NumRuby::UFunc::Copysign
#
# Human Name: Copy Sign
# Description: Copies the sign of one array to another.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1.5, -2.0, 3.0]
#   y = Numo::DFloat[-1.0, 1.0, -1.0]
#   NumRuby.copysign(x, y)
#   # => Numo::DFloat[-1.5, 2.0, -3.0]

module NumRuby
  module UFunc
    module Copysign
      def self.call(x, y)
        Numo::DFloat.cast(x.to_a.zip(y.to_a).map { |a, b| Math.copysign(a, b) })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:copysign, NumRuby::UFunc::Copysign)

module NumRuby
  def self.copysign(x, y)
    UFunc::Copysign.call(x, y)
  end
end
