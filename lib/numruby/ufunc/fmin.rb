# NumRuby::UFunc::Fmin
#
# Human Name: Minimum (ignoring NaNs)
# Description: Returns the minimum of two arrays, ignoring NaNs.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1, Float::NAN, 3]
#   y = Numo::DFloat[2, 2, Float::NAN]
#   NumRuby.fmin(x, y)
#   # => Numo::DFloat[1, 2, 3]

module NumRuby
  module UFunc
    module Fmin
      def self.call(x, y)
        Numo::DFloat.cast(x.to_a.zip(y.to_a).map do |a, b|
          if a.nan?
            b
          elsif b.nan?
            a
          else
            [a, b].min
          end
        end)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:fmin, NumRuby::UFunc::Fmin)

module NumRuby
  def self.fmin(x, y)
    UFunc::Fmin.call(x, y)
  end
end
