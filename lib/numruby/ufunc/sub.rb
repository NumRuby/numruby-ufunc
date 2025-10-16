module NumRuby
  module UFunc
    module Sub
      def self.call(a, b)
        a - b
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:sub, NumRuby::UFunc::Sub)
