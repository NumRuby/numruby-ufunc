# NumRuby::UFunc::Log
#
# Human Name: Natural Log
# Description: Computes natural logarithm elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, Math::E, Math::E**2]
#   NumRuby::UFunc::Log.call(x)
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
