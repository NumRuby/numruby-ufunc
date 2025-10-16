# NumRuby::UFunc::Log2
#
# Human Name: Log Base 2
# Description: Computes base-2 logarithm elementwise on x.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1,2,4]
#   NumRuby::UFunc::Log2.call(x)
module NumRuby
  module UFunc
    module Log2
      def self.call(x)
        Numo::NMath.log(x) / Math.log(2)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log2, NumRuby::UFunc::Log2)
