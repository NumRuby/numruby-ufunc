# NumRuby::UFunc::Round
#
# Human Name: Round
# Description: Rounds each element of x to the nearest integer.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.4,2.5,-1.7]
#   NumRuby::UFunc::Round.call(x)
module NumRuby
  module UFunc
    module Round
      def self.call(x)
        x.map(&:round)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:round, NumRuby::UFunc::Round)
