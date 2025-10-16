# NumRuby::UFunc::Fmax
#
# Human Name: Maximum (ignoring NaNs)
# Description: Returns the maximum of two arrays, ignoring NaNs.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, Float::NAN, 3]
#   y = Numo::DFloat[2, 2, Float::NAN]
#   NumRuby.fmax(x, y)
#   # => Numo::DFloat[2, 2, 3]

module NumRuby
  module UFunc
    module Fmax
      def self.call(x, y)
        Numo::DFloat.cast(x.to_a.zip(y.to_a).map do |a, b|
          if a.nan?
            b
          elsif b.nan?
            a
          else
            [a, b].max
          end
        end)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:fmax, NumRuby::UFunc::Fmax)

module NumRuby
  def self.fmax(x, y)
    UFunc::Fmax.call(x, y)
  end
end
