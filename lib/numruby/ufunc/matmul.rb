# NumRuby::UFunc::Matmul
#
# Human Name: Matrix Multiply
# Description: Matrix product of two arrays.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[[1, 2], [3, 4]]
#   y = Numo::DFloat[[5, 6], [7, 8]]
#   NumRuby.matmul(x, y)
#   # => Numo::DFloat[[19, 22], [43, 50]]

module NumRuby
  module UFunc
    module Matmul
      def self.call(x, y)
        x.dot(y)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:matmul, NumRuby::UFunc::Matmul)

module NumRuby
  def self.matmul(x, y)
    UFunc::Matmul.call(x, y)
  end
end
