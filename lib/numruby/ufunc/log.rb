# NumRuby::UFunc::Log
#
# Human Name: Natural Logarithm
# Description: Computes elementwise natural logarithm of x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, Math::E, Math::E**2]
#   NumRuby.log(x)
#   # => Numo::DFloat[0, 1, 2]

module NumRuby
  module UFunc
    module Log
      def self.call(x)
        Numo::NMath.log(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log, NumRuby::UFunc::Log)

module NumRuby
  def self.log(x)
    UFunc::Log.call(x)
  end
end
