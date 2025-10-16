module NumRuby
  module UFunc
    module Registry
      def self.call(name, *args)
        case name
        when :add
          args[0] + args[1]
        when :sin
          Numo::NMath.sin(args[0])
        else
          raise ArgumentError, "Unknown ufunc: #{name}"
        end
      end
    end
  end
end
