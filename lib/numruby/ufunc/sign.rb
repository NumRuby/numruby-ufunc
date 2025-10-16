# NumRuby::UFunc::Sign
#
# Human Name: Sign
# Description: Returns the sign of each element in x: -1, 0, or 1.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[-2, 0, 3]
#   NumRuby.sign(x)
#   # => Numo::DFloat[-1, 0, 1]

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

module NumRuby
  def self.sign(x)
    UFunc::Sign.call(x)
  end
end
