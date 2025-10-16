# NumRuby::UFunc::Round
#
# Human Name: Round
# Description: Rounds each element of x to the nearest integer.
# Type: Unary
#
# Example:
#   x = Numo::DFloat[1.2, 2.8, -1.7]
#   NumRuby.round(x)
#   # => Numo::DFloat[1, 3, -2]

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

module NumRuby
  def self.round(x)
    UFunc::Round.call(x)
  end
end
