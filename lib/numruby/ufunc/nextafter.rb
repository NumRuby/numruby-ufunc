# NumRuby::UFunc::Nextafter
#
# Human Name: Next Floating Point
# Description: Returns the next floating-point value after each element.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[1.0, 2.0, -1.0]
#   y = Numo::DFloat[2.0, 1.0, 0.0]
#   NumRuby.nextafter(x, y)
#   # => Numo::DFloat[next representable value in direction of y]

module NumRuby
  module UFunc
    module Nextafter
      def self.call(x, y)
        Numo::DFloat.cast(x.to_a.zip(y.to_a).map { |a, b| nextafter_scalar(a, b) })
      end

      def self.nextafter_scalar(x, y)
        # Handle special cases
        return Float::NAN if x.nan? || y.nan?
        return x if x == y

        # Handle infinity cases
        if x.infinite?
          if x.positive? && y < x
            return Float::MAX
          elsif x.negative? && y > x
            return -Float::MAX
          else
            return x
          end
        end

        # For finite numbers, determine direction and find next representable value
        if y > x
          # Find next larger value
          next_up(x)
        else
          # Find next smaller value
          next_down(x)
        end
      end

      def self.next_up(x)
        return Float::INFINITY if x == Float::MAX
        return Float::MIN if x == -Float::INFINITY

        if x == 0.0
          Float::MIN
        elsif x.positive?
          x + (x * Float::EPSILON / 2)
        else
          x - ((-x) * Float::EPSILON / 2)
        end
      end

      def self.next_down(x)
        return -Float::INFINITY if x == -Float::MAX
        return Float::MAX if x == Float::INFINITY

        if x == 0.0
          -Float::MIN
        elsif x.positive?
          x - (x * Float::EPSILON / 2)
        else
          x + ((-x) * Float::EPSILON / 2)
        end
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:nextafter, NumRuby::UFunc::Nextafter)

module NumRuby
  def self.nextafter(x, y)
    UFunc::Nextafter.call(x, y)
  end
end
