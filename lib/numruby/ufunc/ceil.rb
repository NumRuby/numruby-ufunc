# NumRuby::UFunc::Ceil
#
# Human Name: Ceiling
# Description: Computes the elementwise ceiling of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.2, 2.8, -1.7]
#   NumRuby.ceil(x)
#   # => Numo::DFloat[2, 3, -1]

module NumRuby
  module UFunc
    module Ceil
      def self.call(x)
        x.map(&:ceil)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:ceil, NumRuby::UFunc::Ceil)

module NumRuby
  def self.ceil(x)
    UFunc::Ceil.call(x)
  end
end
