# NumRuby::UFunc::Power
#
# Human Name: Power
# Description: Raises elements of one array to the powers of another array element-wise.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[2, 3, 4]
#   y = Numo::DFloat[2, 3, 2]
#   NumRuby.power(x, y)
#   # => Numo::DFloat[4.0, 27.0, 16.0]

module NumRuby
  module UFunc
    module Power
      def self.call(x, y)
        x**y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:power, NumRuby::UFunc::Power)

module NumRuby
  def self.power(x, y)
    UFunc::Power.call(x, y)
  end
end
