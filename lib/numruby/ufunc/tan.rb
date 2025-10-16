module NumRuby
  module UFunc
    module Tan
      def self.call(a)
        Numo::NMath.tan(a)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:tan, NumRuby::UFunc::Tan)
