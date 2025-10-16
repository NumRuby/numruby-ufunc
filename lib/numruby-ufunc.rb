require "numo/narray"
require_relative "numruby/ufunc/version"
require_relative "numruby/ufunc/registry"

module NumRuby
  module UFunc
    # Optional convenience method to mirror NumPy style
    def self.call(name, *, **)
      Registry.call(name, *, **)
    end
  end
end
