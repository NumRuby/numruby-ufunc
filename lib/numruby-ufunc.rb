require "numo/narray"
require_relative "numruby/ufunc/version"
require_relative "numruby/ufunc/registry"

module NumRuby
  module UFunc
    # Optional convenience method to mirror NumPy style
    def self.call(name, *args, **kwargs)
      Registry.call(name, *args, **kwargs)
    end
  end
end
