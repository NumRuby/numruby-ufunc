# NumRuby::UFunc::Sin
#
# Human Name: Sine
# Description: Computes sine elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[0, Math::PI/2, Math::PI]
#   NumRuby::UFunc::Sin.call(x)
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
