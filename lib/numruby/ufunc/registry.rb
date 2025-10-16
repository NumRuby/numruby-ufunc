module NumRuby
  module UFunc
    module Registry
      @ufuncs = {}

      class << self
        attr_reader :ufuncs

        def register(name, mod)
          @ufuncs[name.to_sym] = mod
        end

        def call(name, *)
          mod = @ufuncs[name.to_sym]
          raise ArgumentError, "Unknown ufunc: #{name}" unless mod

          mod.call(*)
        end
      end
    end
  end
end
