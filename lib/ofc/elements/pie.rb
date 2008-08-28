module Ofc
  class Elements

    # Pie chart
    # :alpha          : float (0.5)
    # :animate        : boolean (true||false) default true
    # :colour         : hex color (#900000)
    # :colours        : array of hex colors (["#900000", "#009000"])
    # :gradient-fill  : integer (1)
    # :start-angle    : integer (90)
    # :stroke         : integer (1)
    # :tip            : string ('#val# of #total#')
    class Pie < Base
      default_chart_attributes  :type           =>  'pie',
                                :alpha          =>  0.5,
                                :animate        =>  1,
                                :colours        =>  ['#900000', '#009000'],
                                :font_size      => 10,
                                :gradient_fill  =>  1,
                                :label_colour   =>  '#900000',
                                :start_angle    =>  90,
                                :stroke         =>  1,
                                :tip            =>  nil,
                                :labels         =>  []
                    
      alias_attribute :label_color, :label_colour
      alias_attribute :colors, :colours
      
      # returns an array of hashes
      def labelled_values
        if labels.empty?
          values
        else
          lv = []
          self.values.each_with_index do |v,i|
            if labels[i] && !v.is_a?(Hash)
              lv << {"value" => v, "label" => labels[i].to_s}
            else
              lv << v
            end
          end
          lv
        end
      end
      
      def to_json(*a)
        # create a hash of values and labels before we call to_json
        self.values = labelled_values
        super
      end
    end

  end
end