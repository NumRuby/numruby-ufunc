module NumRuby
  module UFunc
    module Div
      def self.call(a, b)
        a / b
      end
    end
  end
end

NumRuby::UFunc::Registry.register(:div, NumRuby::UFunc::Div)
