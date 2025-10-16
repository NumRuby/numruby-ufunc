# NumRuby::UFunc::Log10
#
# Human Name: Log Base 10
# Description: Computes base-10 logarithm elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1,10,100]
#   NumRuby::UFunc::Log10.call(x)
module NumRuby
  module UFunc
    module Log10
      def self.call(x)
        Numo::NMath.log10(x)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log10, NumRuby::UFunc::Log10)
