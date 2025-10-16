# NumRuby::UFunc::Trunc
#
# Human Name: Truncate
# Description: Truncates each element toward zero.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.7,-2.3,0]
#   NumRuby::UFunc::Trunc.call(x)
module NumRuby
  module UFunc
    module Trunc
      def self.call(x)
        x.map(&:truncate)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:trunc, NumRuby::UFunc::Trunc)
