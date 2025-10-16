# NumRuby::UFunc::Conjugate
#
# Human Name: Complex Conjugate
# Description: Returns the complex conjugate of each element.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1, 2, 3]
#   NumRuby.conjugate(x)
#   # => Numo::DFloat[1.0, 2.0, 3.0]

module NumRuby
  module UFunc
    module Conjugate
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

NumRuby::UFunc::Registry.register(:conjugate, NumRuby::UFunc::Conjugate)

module NumRuby
  def self.conjugate(x)
    UFunc::Conjugate.call(x)
  end
end
