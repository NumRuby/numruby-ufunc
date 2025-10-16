# NumRuby::UFunc::Maximum
#
# Human Name: Maximum
# Description: Computes elementwise maximum of x and y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 4, 3]
#   y = Numo::DFloat[2, 2, 5]
#   NumRuby.maximum(x, y)
#   # => Numo::DFloat[2, 4, 5]

module NumRuby
  module UFunc
    module Maximum
      def self.call(x, y)
        Numo::DFloat[x.to_a.zip(y.to_a).map { |a, b| a > b ? a : b }]
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:maximum, NumRuby::UFunc::Maximum)

module NumRuby
  def self.maximum(x, y)
    UFunc::Maximum.call(x, y)
  end
end
