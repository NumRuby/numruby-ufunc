require "numo/narray"
require_relative "ufunc/version"
require_relative "ufunc/registry"

# Dynamically require all ufunc definition files
Dir[File.join(__dir__, "ufunc", "*.rb")].each do |file|
  next if file.end_with?("version.rb") || file.end_with?("registry.rb") || file.end_with?("delegators.rb")

  require_relative File.join("ufunc", File.basename(file))
end

require_relative "ufunc/delegators"

module NumRuby
  module UFunc
    # Optional: generic call interface
    def self.call(name, *args)
      Registry.call(name, *args)
    end
  end
end
