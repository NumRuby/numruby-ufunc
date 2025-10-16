module NumRuby
  module UFunc
    module Sin
      def self.call(a)
        Numo::NMath.sin(a)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sin, NumRuby::UFunc::Sin)
