# NumRuby::UFunc::Sign
#
# Human Name: Sign
# Description: Returns -1, 0, or 1 for each element depending on its sign.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-5,0,7]
#   NumRuby::UFunc::Sign.call(x)
module NumRuby
  module UFunc
    module Sign
      def self.call(x)
        x.map { |a| a < 0 ? -1 : a > 0 ? 1 : 0 }
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sign, NumRuby::UFunc::Sign)
