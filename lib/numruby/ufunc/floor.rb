# NumRuby::UFunc::Floor
#
# Human Name: Floor
# Description: Rounds each element of x down to the nearest integer.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.9,2.5,-1.7]
#   NumRuby::UFunc::Floor.call(x)
#   # => Numo::DFloat[1,2,-2]
module NumRuby
  module UFunc
    module Floor
      def self.call(x)
        x.map(&:floor)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:floor, NumRuby::UFunc::Floor)
