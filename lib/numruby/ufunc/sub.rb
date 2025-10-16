# NumRuby::UFunc::Sub
#
# Human Name: Subtraction
# Description: Computes elementwise difference x - y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[5,7,9]
#   y = Numo::DFloat[1,2,3]
#   NumRuby::UFunc::Sub.call(x, y)
module NumRuby
  module UFunc
    module Sub
      def self.call(x, y)
        x - y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sub, NumRuby::UFunc::Sub)
