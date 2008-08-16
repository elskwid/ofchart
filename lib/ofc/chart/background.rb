module Ofc
  class Chart
    # Background
    # :bg_colour : hex color (#f8f8d8)
    # :bg_image  : ??
    class Background < Base
      attr_accessor_with_default :bg_colour,  '#f8f8d8' 
      attr_accessor_with_default :bg_image,   nil

      alias_attribute :bg_color, :bg_colour
      alias_attribute :color, :bg_colour
      alias_attribute :image, :bg_image
    end
    
  end
end