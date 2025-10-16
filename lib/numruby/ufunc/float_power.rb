# NumRuby::UFunc::FloatPower
#
# Human Name: Float Power
# Description: First array elements raised to powers from second array, element-wise.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[2, 3, 4]
#   y = Numo::DFloat[2, 3, 2]
#   NumRuby.float_power(x, y)
#   # => Numo::DFloat[4.0, 27.0, 16.0]

module NumRuby
  module UFunc
    module FloatPower
      def self.call(x, y)
        x.cast_to(Numo::DFloat)**y.cast_to(Numo::DFloat)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:float_power, NumRuby::UFunc::FloatPower)

module NumRuby
  def self.float_power(x, y)
    UFunc::FloatPower.call(x, y)
  end
end
