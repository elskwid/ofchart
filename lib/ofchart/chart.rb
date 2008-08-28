module Ofchart
  
  # A similar idea to Gchart (in fact, some of these ideas are right from GChart) and the other Open Flash Chart libraries, 
  # this is a shortcut to build charts using OFC. Ofc::x is there to help keep it all composed.
  class Chart
    
    # supported chart types
    @@types = ['bar', 'bar_3d', 'bar_candle', 'bar_fade', 'bar_filled', 'bar_glass', 'bar_outline', 'bar_sketch', 'bar_stack', 'hbar',
               'area_hollow', 'line', 'line_dot', 'line_hollow', 'pie', 'scatter']
    
    attr_accessor :type, # type of chart from list of types
                  :theme, # internal - so we know what theme is loaded
                  :data, 
                  :size, # shortcut for width and height (200x200)
                  :width, # width of the chart in pixels
                  :height, # height of the chart in pixels
                  :background_color, # color of background
                  :color, # foreground color, this will be carried through to all objects like grid, ticks, etc unless set 
                  :colors, # array of colors, if something needs more than one color, these are them
                  :outline_color, # for objects with an outline this is the color
                  :title, # title text
                  :title_color, # foreground color of the title 
                  :title_size, # font-size of the title
                  :title_style, # hash of style for the title
                  :tip, # static text or magic vars #percent# #val# #total# (others?)
                  :tip_background_color, # color for the background of the tips
                  :tip_color, # foreground color for the first line of the tip
                  :tip_style, # style for the first line of the tip
                  :tip_body_style, # style for the body of the tips (everything past the first line)
                  :tip_rounded, # (true || false) rounded corners, default true
                  :tip_border_width, # weight of the border (stroke)
                  :tip_shadowed, # (true || false) shadow on the tips
                  :grid_color, # this is the color for x&y axis on the grid
                  :x_steps, # how many x ticks are visible (2 makes every 2nd step visible)
                  :x_color, # color for the xaxis not the grid
                  :x_key, # x key text
                  :x_key_size, # font-size for the x key
                  :x_legend, # text for the x legend
                  :x_legend_color, # foreground color for x legend
                  :x_legend_size, # font-size of the x legend
                  :x_legend_style, # hash of style for the x legend
                  :x_labels, # array of labels for x axis
                  :x_label_color, # color for x labels
                  :x_label_size, # font-size for x labels
                  :x_label_orientation, # (horizontal || vertical) default to horizontal
                  :y_steps, # how many y ticks are visible (2 makes every 2nd step visible)
                  :y_color, # color for the yaxis not the grid
                  :y_legend, # text for the y legend
                  :y_legend_color, # foreground color for y legend
                  :y_legend_size, # font-size of the y legend
                  :y_legend_style, # hash of style for the y legend
                  :y_labels, # array of labels for y axis
                  :y_label_color, # color for y labels
                  :y_label_size, # font-size for y labels
                  :dot_size, # for charts with dots, this is the size 
                  :dot_margin, # for charts with dots, this is the margin around them (ofc calls this the halo)
                  :pie_labels, # labels the pie slices (not the same as the tooltip)
                  :pie_label_color,
                  :pie_label_size,
                  :pie_label_style,
                  :animate_pie, # (true | false) if the pie should be animated (default true [1])
                  :pie_angle, # the angle of the start of the pie (default is 90)
                  :line_width # used to set the stroke/line width in places
                  
    class << self
      # Supports the GChart style call
      # Ofchart.line(:title => 'my title, :size => '200x500')
      # Ofchart.pie(:title => 'mmmm pie', :data => [10,20,30])
      # etc
      def method_missing(meth, options={})
        # theme loading is in the initialize
        if @@types.include?(meth.to_s)
          chart = new(options.merge({:type => "#{meth}"}))
          chart.build_chart
          # @chart.to_json
        else
          "#{meth} is not a supported chart. Please use one of the following: #{@@types.join(' ')}"
        end
      end
      
      def supported_types
        @@types
      end
    end
    
    def initialize(options={})
      # defaults
      @type = 'line'
      @data = []
      @width = 300
      @height = 200
      @title_style = {}
      # load the default theme & merge with the passed theme if it is there
      default_theme = Ofchart::Theme.load('default').to_chart_options
      theme = options[:theme] ? default_theme.merge(Ofchart::Theme.load(options[:theme]).to_chart_options) : default_theme
      options.merge!(theme)
      # set options passed in the options hash, if they have been defined
      options.each do |attribute, value| 
          send("#{attribute.to_s}=", value) if self.respond_to?("#{attribute}=")
      end
    end
    
    # redifine size to do the magic with the x
    def size=(size='300x200')
      @width, @height = size.split("x").map { |dimension| dimension.to_i }
    end
    
    def size
      "#{@width}x#{@height}"
    end
    
    def build_chart
      # TODO: Is there a better way to only set values for those that have
      # been set in this interface? For now, just check each of them.
      @chart = Ofc::Chart.new
      # @width & @height are outside the chart (part of the html/js)
      @chart.width = @width if @width
      @chart.height = @height if @height
      # background
      @chart.background.bg_colour = @background_color if @background_color
      # title
      @chart.title.text = @title if @title
      @title_style ||= {}
      @title_style['color'] = @title_color unless @title_style['color']
      @title_style['font-size']= @title_size unless @title_style['font-size']
      # This doesn't quite work the way I want
      # @title_style.merge!({'color' => @title_color, 'font-size' => @title_size}) if @title_style.empty? # merge style with color & size
      @chart.title.style = css(@title_style) if @title_style
      # tool tip
      @chart.tool_tip.text = @tip if @tip
      @chart.tool_tip.background = @tip_background_color if @tip_background_color
      @chart.tool_tip.colour = @tip_color if @tip_color
      @chart.tool_tip.title = css(@tip_style) if @tip_style
      @chart.tool_tip.body = css(@tip_body_style) if @tip_body_style
      @chart.tool_tip.rounded = @tip_rounded ? 1 : 0 unless @tip_rounded.nil?
      @chart.tool_tip.stroke = @tip_border_width if @tip_border_width
      @chart.tool_tip.shadow = @tip_shadowed unless @tip_shadowed.nil?
      # x axis
      @chart.x_axis.grid_colour = @grid_color if @grid_color
      @chart.x_axis.steps = @x_steps if @x_steps
      @chart.x_axis.colour = @x_color if @x_color
      # x legend
      @chart.x_legend.text = @x_legend if @x_legend
      @x_legend_style ||= {}
      @x_legend_style['color'] = @x_legend_color unless @x_legend_style['color']
      @x_legend_style['font-size'] = @x_legend_size unless @x_legend_style['font-size']
      # @x_legend_style.merge!({'color' => @x_legend_color, 'font-size' => @x_legend_size})  if @x_legend_style.empty? # merge style with color & size
      @chart.x_legend.style = css(@x_legend_style) if @x_legend_style
      # x labels
      @chart.x_axis_labels.labels = @x_labels if @x_labels
      @chart.x_axis_labels.size = @x_label_size if @x_label_size
      @chart.x_axis_labels.colour = @x_label_color if @x_axis_label_color
      @chart.x_axis_labels.rotate = @x_label_orientation if @x_label_orientation
      # y axis
      @chart.y_axis.grid_colour = @grid_color if @grid_color
      @chart.y_axis.steps = @y_steps if @y_steps
      @chart.y_axis.colour = @y_color if @y_color
      # y legend
      @chart.y_legend.text = @y_legend if @y_legend
      @y_legend_style ||= {}
      @y_legend_style['color'] = @y_legend_color unless @y_legend_style['color']
      @y_legend_style['font-size'] = @y_legend_size unless @y_legend_style['font-size']
      # @y_legend_style.merge!({'color' => @y_legend_color, 'font-size' => @y_legend_size}) if @y_legend_style.empty? # merge style with color & size
      @chart.y_legend.style = css(@y_legend_style) if @y_legend_style
      # y labels
      @chart.y_axis_labels.labels = @y_labels if @y_labels
      @chart.y_axis_labels.size = @y_label_size if @y_label_size
      @chart.y_axis_labels.colour = @y_label_color if @y_label_color
      
      # chart type
      @element = chart_factory(@type)
      
      # set the dot specific stuff
      if is_dottable_chart(@type)
        @element.dot_size = @dot_size if @dot_size
        @element.halo_size = @dot_margin + @dot_size if @dot_margin
      end
      
      # set the rest, some colors aren't used by some charts, but it doesn't hurt to have
      # it in the json (I think?!?)
      @element.colour = @color if @element.respond_to?(:color) && @color
      @element.colors = @colors if @element.respond_to?(:colors) && @colors
      @element.outline_color = @outline_color if @element.respond_to?(:outline_color) && @outline_color
      @element.text = @x_key if @element.respond_to?(:text) && @x_key
      @element.font_size = @x_key_size if @element.respond_to?(:font_size) && @x_key_size
      @element.width = @line_width if @element.respond_to?(:width) && @line_width
      @element.stroke = @line_width if @element.respond_to?(:stroke) && @line_width

      # set the pie stuff
      if @type == 'pie'
        @pie_label_style ||= {}
        @pie_label_style['color'] = @pie_label_color unless @pie_label_style['color']
        @pie_label_style['font-size'] = @pie_label_size unless @pie_label_style['font-size']
        # @y_legend_style.merge!({'color' => @y_legend_color, 'font-size' => @y_legend_size}) if @y_legend_style.empty? # merge style with color & size
        # @chart.pie.style = css(@pie_label_style) if @pie_label_style
        @element.label_colour = @pie_label_style['color']
        @element.font_size = @pie_label_style['font-size']
        @element.animate = @animate_pie ? 1 : 0 unless @animate_pie.nil?
        @element.start_angle = @pie_angle if @pie_angle
        @element.labels = @pie_labels unless @pie_labels.nil?
        @element.tip = @tip if @tip
      end
      
      # the data
      @element.values = @data
      
      @chart.elements << @element
      
      # the finished chart
      @chart
    end
        
    private
      
      def css(hash)
        # TODO: Would like this to be to_css on Hash
        css = '{'
        css << hash.map{|k,v| "#{k}:#{v};"}.join(' ') if hash
        css << '}'
      end
      
      # TODO: Could this be factored into the ofc class?
      def chart_factory(chart_type)
        case chart_type.to_sym
          when :bar         : Ofc::Elements::Bar.new
          when :bar_3d      : Ofc::Elements::Bar3D.new
          when :bar_candle  : Ofc::Elements::BarCandle.new
          when :bar_fade    : Ofc::Elements::BarFade.new
          when :bar_glass   : Ofc::Elements::BarGlass.new
          when :bar_filled  : Ofc::Elements::BarFilled.new
          when :bar_outline : Ofc::Elements::BarOutline.new
          when :bar_sketch  : Ofc::Elements::BarSketch.new
          when :bar_stack   : Ofc::Elements::BarStack.new
          when :hbar        : Ofc::Elements::HBar.new
          when :area_hollow : Ofc::Elements::AreaHollow.new
          when :line        : Ofc::Elements::Line.new
          when :line_dot    : Ofc::Elements::LineDot.new
          when :line_hollow : Ofc::Elements::LineHollow.new
          when :pie         : Ofc::Elements::Pie.new
          when :scatter     : Ofc::Elements::Scatter.new
        end
      end
      
      # TODO: Move this into the chart itself
      def is_dottable_chart(chart_type)
        [:area_hollow, :line, :line_dot, :line_hollow, :scatter].include?(chart_type.to_sym)
      end
      
  end
  
end