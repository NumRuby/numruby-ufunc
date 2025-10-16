# NumRuby::UFunc::Floor
#
# Human Name: Floor
# Description: Computes the elementwise floor of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.7, 2.8, -1.3]
#   NumRuby.floor(x)
#   # => Numo::DFloat[1, 2, -2]

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

module NumRuby
  def self.floor(x)
    UFunc::Floor.call(x)
  end
end
