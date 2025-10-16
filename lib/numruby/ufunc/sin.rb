# NumRuby::UFunc::Sin
#
# Human Name: Sine
# Description: Computes the elementwise sine of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/2, Math::PI]
#   NumRuby.sin(x)
#   # => Numo::DFloat[0, 1, 0]

module NumRuby
  module UFunc
    module Sin
      def self.call(x)
        Numo::NMath.sin(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sin, NumRuby::UFunc::Sin)

module NumRuby
  def self.sin(x)
    UFunc::Sin.call(x)
  end
end
