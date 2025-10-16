# NumRuby::UFunc::Conj
#
# Human Name: Complex Conjugate
# Description: Returns the complex conjugate of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   NumRuby.conj(x)
#   # => Numo::DFloat[1.0, 2.0, 3.0]

module NumRuby
  module UFunc
    module Conj
      def self.call(x)
        # For real arrays, conjugate is identity
        # For complex arrays, this would flip the sign of imaginary part
        if x.respond_to?(:conj)
          x.conj
        else
          x
        end
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:conj, NumRuby::UFunc::Conj)

module NumRuby
  def self.conj(x)
    UFunc::Conj.call(x)
  end
end
