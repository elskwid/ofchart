module Ofc
  class Chart
    # XAxis
    # colour      : hex color (#784016)
    # grid_colour : hex color (#F5E1AA)
    # max         : integer|null (null)
    # min         : integer (0)
    # offset      : boolean (true)
    # steps       : integer (1)
    # stroke      : integer (2)
    # three_d     : integer (0)
    # tick_height : integer (3)
    class XAxis
      attr_accessor :colour,
                    :grid_colour,
                    :max,
                    :min,
                    :offset,
                    :steps,
                    :stroke,
                    :three_d, # 3d
                    :tick_height
                     
      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour
      
      def initialize
        @colour = '#784016'
        @grid_colour = '#f5e1aa'
        @max = nil
        @min = 0
        @offset = true
        @steps = 1
        @stroke = 2
        @three_d = 0
        @tick_height = 3
      end
    end
  
    # XAxis Labels
    # colour  : hex color (#000000)
    # labels  : array ([])
    # rotate  : integer null|1|2 (null)
    # size    : integer (10)
    # steps   : integer (1)
    # visible : boolean (true)
    class XAxisLabels
      attr_accessor :colour,
                    :labels,
                    :rotate,
                    :size,
                    :steps,
                    :visible

      alias_attribute :color, :colour
      
      def initialize
        @colour = '#000000'
        @labels = []
        @rotate = nil
        @size = 10
        @steps = 1
        @visible = true
      end
    end
    
    
    # YAxisBase
    # colour      : hex color (#784016)
    # grid_colour : hex color (#F5E1AA)
    # max         : integer|null (null) [10 for YAxis right]
    # min         : integer (0)
    # offset      : boolean (false)
    # steps       : integer (1)
    # stroke      : integer (2)
    # three_d     : integer (0)
    # tick_length : integer (3)    
    # visible     : boolean (true) [false for YAxis right]
    class YAxisBase
      attr_accessor :colour,
                    :grid_colour,
                    :max,
                    :min,
                    :offset,
                    :steps,
                    :stroke,
                    :three_d,
                    :tick_length,
                    :visible

      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour 
      
      def initialize
        @colour = '#784016'
        @grid_colour = '#f5e1aa'
        @max = nil
        @min = 0
        @offset = false
        @steps = 1
        @stroke = 2
        @three_d = 0
        @tick_length = 3
        @visible = true
      end
    end
    
    # YAxis
    class YAxis < YAxisBase
      # json name y_axis
    end
    
    #Y2Axis
    # max         : integer|null (10)
    # visible     : boolean (false)
    class Y2Axis < YAxisBase
      # json name y_axis_right
      def initialize
        super
        @max = 10
        @visible = false
      end
    end
    
    # YAxis LabelsBase
    # colour  : hex color (#000000)
    # labels  : array ([])
    # size    : integer (10)
    # steps   : integer (?)
    # visible : boolean (true)
    class YAxisLabelsBase
      attr_accessor :colour,
                    :labels,
                    :size,
                    :steps,
                    :visible
                    
      alias_attribute :color, :colour
      
      def initialize
        @colour = '#000000'
        @labels =[]
        @size = 10
        @steps = nil
        @visible = true
      end
    end

    class YAxisLabels < YAxisLabelsBase
      # json name y_label_
    end
    
    class Y2AxisLabels < YAxisLabelsBase
      # json name y_label_2_
    end
    
  end
  
end