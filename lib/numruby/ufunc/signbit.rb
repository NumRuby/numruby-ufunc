# NumRuby::UFunc::Signbit
#
# Human Name: Sign Bit
# Description: Checks if the sign bit of each element is set.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.0, -2.5, 0.0, -0.0]
#   NumRuby.signbit(x)
#   # => Numo::Bit[0, 1, 0, 1]

module NumRuby
  module UFunc
    module Signbit
      def self.call(x)
        Numo::Bit.cast(x.to_a.map { |a| Math.copysign(1.0, a) < 0 ? 1 : 0 })
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:signbit, NumRuby::UFunc::Signbit)

module NumRuby
  def self.signbit(x)
    UFunc::Signbit.call(x)
  end
end
