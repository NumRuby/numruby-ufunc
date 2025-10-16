module NumRuby
  module UFunc
    module Cos
      def self.call(a)
        Numo::NMath.cos(a)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:cos, NumRuby::UFunc::Cos)
