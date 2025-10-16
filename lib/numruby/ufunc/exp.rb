module NumRuby
  module UFunc
    module Exp
      def self.call(a)
        Numo::NMath.exp(a)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:exp, NumRuby::UFunc::Exp)
