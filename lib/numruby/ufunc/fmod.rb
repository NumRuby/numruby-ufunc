# NumRuby::UFunc::Fmod
#
# Human Name: Modulus
# Description: Computes the remainder of division for each element.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[7, 8, 9]
#   y = Numo::DFloat[2, 3, 4]
#   NumRuby.fmod(x, y)
#   # => Numo::DFloat[1.0, 2.0, 1.0]

module NumRuby
  module UFunc
    module Fmod
      def self.call(x, y)
        x % y
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:fmod, NumRuby::UFunc::Fmod)

module NumRuby
  def self.fmod(x, y)
    UFunc::Fmod.call(x, y)
  end
end
