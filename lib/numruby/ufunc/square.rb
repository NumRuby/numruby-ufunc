# NumRuby::UFunc::Square
#
# Human Name: Square
# Description: Computes the square of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 2, 3, 4]
#   NumRuby.square(x)
#   # => Numo::DFloat[1.0, 4.0, 9.0, 16.0]

module NumRuby
  module UFunc
    module Square
      def self.call(x)
        x * x
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:square, NumRuby::UFunc::Square)

module NumRuby
  def self.square(x)
    UFunc::Square.call(x)
  end
end
