# NumRuby::UFunc::Add
#
# Human Name: Addition
# Description: Computes elementwise sum of x and y.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   y = Numo::DFloat[4, 5, 6]
#   NumRuby.add(x, y)
#   # => Numo::DFloat[5, 7, 9]

module NumRuby
  module UFunc
    module Add
      def self.call(x, y)
        x + y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:add, NumRuby::UFunc::Add)

module NumRuby
  def self.add(x, y)
    UFunc::Add.call(x, y)
  end
end
