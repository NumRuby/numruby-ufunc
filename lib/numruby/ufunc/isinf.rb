# NumRuby::UFunc::Isinf
#
# Human Name: Infinite Check
# Description: Checks if each element is infinite.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.0, Float::NAN, Float::INFINITY, -Float::INFINITY, 2.5]
#   NumRuby.isinf(x)
#   # => Numo::Bit[0, 0, 1, 1, 0]

module NumRuby
  module UFunc
    module Isinf
      def self.call(x)
        Numo::Bit.cast(x.to_a.map { |a| a.infinite? ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:isinf, NumRuby::UFunc::Isinf)

module NumRuby
  def self.isinf(x)
    UFunc::Isinf.call(x)
  end
end
