module Ofc
  class Chart
    # Background
    # :bg_colour : hex color (#f8f8d8)
    # :bg_image  : ??
    class Background
      attr_accessor :colour, #bg_colour
                    :image #bg_image

      alias_attribute :color, :colour
    end
  end
end