# NumRuby::UFunc::Isfinite
#
# Human Name: Finite Check
# Description: Checks if each element is finite (not NaN, inf, or -inf).
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.0, Float::NAN, Float::INFINITY, -Float::INFINITY, 2.5]
#   NumRuby.isfinite(x)
#   # => Numo::Bit[1, 0, 0, 0, 1]

module NumRuby
  module UFunc
    module Isfinite
      def self.call(x)
        Numo::Bit.cast(x.to_a.map { |a| a.finite? ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:isfinite, NumRuby::UFunc::Isfinite)

module NumRuby
  def self.isfinite(x)
    UFunc::Isfinite.call(x)
  end
end
