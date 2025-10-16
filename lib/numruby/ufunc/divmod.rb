# NumRuby::UFunc::Divmod
#
# Human Name: Division Modulus
# Description: Return element-wise quotient and remainder simultaneously.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[7, 8, 9]
#   y = Numo::DFloat[2, 3, 4]
#   NumRuby.divmod(x, y)
#   # => [Numo::DFloat[3.0, 2.0, 2.0], Numo::DFloat[1.0, 2.0, 1.0]]

module NumRuby
  module UFunc
    module Divmod
      def self.call(x, y)
        quotient = (x / y).floor
        remainder = x % y
        [quotient, remainder]
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:divmod, NumRuby::UFunc::Divmod)

module NumRuby
  def self.divmod(x, y)
    UFunc::Divmod.call(x, y)
  end
end
