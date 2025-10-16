# NumRuby::UFunc::FloorDivide
#
# Human Name: Floor Division
# Description: Divides and floors the result for each element.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[7, 8, 9]
#   y = Numo::DFloat[2, 3, 4]
#   NumRuby.floor_divide(x, y)
#   # => Numo::DFloat[3.0, 2.0, 2.0]

module NumRuby
  module UFunc
    module FloorDivide
      def self.call(x, y)
        (x / y).floor
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:floor_divide, NumRuby::UFunc::FloorDivide)

module NumRuby
  def self.floor_divide(x, y)
    UFunc::FloorDivide.call(x, y)
  end
end
