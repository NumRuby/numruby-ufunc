module NumRuby
  module UFunc
    Registry.ufuncs.each_key do |name|
      define_singleton_method(name) do |*args|
        Registry.call(name, *args)
      end
    end
  end
end
