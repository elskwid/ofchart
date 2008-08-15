module Ofc
  class Elements

    class Scatter < Base
      attr_accessor :colour,
                    :dot_size, #dot-size
                    :font_size,  # font-size
                    :text,
                    :width
                    
      alias_attribute :color, :colour
      
      def initialize
        @colour = '#3030d0'
        @dot_size = 5
        @font_size = 12
        @text = ''
        @width = 2
      end
    end
                 
  end
end