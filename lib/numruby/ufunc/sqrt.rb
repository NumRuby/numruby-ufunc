module NumRuby
  module UFunc
    module Sqrt
      def self.call(a)
        Numo::NMath.sqrt(a)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sqrt, NumRuby::UFunc::Sqrt)
