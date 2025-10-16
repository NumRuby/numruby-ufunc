module NumRuby
  module UFunc
    module Add
      def self.call(a, b)
        a + b
      end
    end
  end
end

# Register with the central registry
NumRuby::UFunc::Registry.register(:add, NumRuby::UFunc::Add)
