# NumRuby::UFunc::Sub
#
# Human Name: Subtraction
# Description: Computes elementwise difference x - y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[5, 7, 9]
#   y = Numo::DFloat[2, 3, 4]
#   NumRuby.sub(x, y)
#   # => Numo::DFloat[3, 4, 5]

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

module NumRuby
  def self.sub(x, y)
    UFunc::Sub.call(x, y)
  end
end
