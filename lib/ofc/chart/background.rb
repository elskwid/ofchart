module Ofc
  class Chart
    # Background
    # :bg_colour : hex color (#f8f8d8)
    # :bg_image  : ??
    class Background
      attr_accessor :bg_colour, #bg_colour
                    :bg_image #bg_image

      alias_attribute :bg_color, :bg_colour
      alias_attribute :color, :bg_colour
      alias_attribute :image, :bg_image
      
      def initialize
        @bg_colour = '#f8f8d8'
        @bg_image = nil
      end
    end
  end
end