# NumRuby::UFunc::Heaviside
#
# Human Name: Heaviside Step Function
# Description: Compute the Heaviside step function.
# Type: Binary
#
# Example:
#   x = Numo::DFloat[-1, 0, 1]
#   y = Numo::DFloat[0.5, 0.5, 0.5]
#   NumRuby.heaviside(x, y)
#   # => Numo::DFloat[0.0, 0.5, 1.0]

module NumRuby
  module UFunc
    module Heaviside
      def self.call(x, y)
        result = Numo::DFloat.zeros(*x.shape)

        # Process each element
        x.flatten.each_with_index do |x_val, i|
          result.flatten[i] = if x_val.positive?
                                1.0
                              elsif x_val.zero?
                                y.flatten[i]
                              else
                                0.0
                              end
        end

        result
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:heaviside, NumRuby::UFunc::Heaviside)

module NumRuby
  def self.heaviside(x, y)
    UFunc::Heaviside.call(x, y)
  end
end
