module NumRuby
  module UFunc
    module Mul
      def self.call(a, b)
        a * b
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:mul, NumRuby::UFunc::Mul)
