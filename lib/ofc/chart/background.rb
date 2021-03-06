module Ofc
  class Chart
    # Background
    # :bg_colour : hex color (#f8f8d8)
    # :bg_image  : ??
    class Background < Base
      default_chart_attributes  :object_name  =>  'bg_colour',
                                :bg_colour    =>  '#f8f8d8',
                                :bg_image     =>  nil

      alias_attribute :bg_color, :bg_colour
      alias_attribute :color, :bg_colour
      alias_attribute :image, :bg_image
      
      def to_json(*a)
        # background is a seperate object in OFC, shown at the top level
        "#{bg_colour.to_json}"
      end
    end
    
  end
end