module NumRuby
  module UFunc
    module Log
      def self.call(a)
        Numo::NMath.log(a)
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:log, NumRuby::UFunc::Log)
