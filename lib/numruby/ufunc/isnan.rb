# NumRuby::UFunc::Isnan
#
# Human Name: NaN Check
# Description: Checks if each element is NaN.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.0, Float::NAN, 2.5, Float::NAN]
#   NumRuby.isnan(x)
#   # => Numo::Bit[0, 1, 0, 1]

module NumRuby
  module UFunc
    module Isnan
      def self.call(x)
        Numo::Bit.cast(x.to_a.map { |a| a.nan? ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:isnan, NumRuby::UFunc::Isnan)

module NumRuby
  def self.isnan(x)
    UFunc::Isnan.call(x)
  end
end
