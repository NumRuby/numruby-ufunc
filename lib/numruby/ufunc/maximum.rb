# NumRuby::UFunc::Maximum
#
# Human Name: Maximum
# Description: Computes elementwise maximum of x and y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1,5,3]
#   y = Numo::DFloat[2,2,4]
#   NumRuby::UFunc::Maximum.call(x, y)
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
