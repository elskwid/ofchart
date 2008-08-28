require 'yaml'

module Ofchart
  class Theme
    class ThemeNotFound < RuntimeError; end
    
    @@theme_files = ["#{File.dirname(__FILE__)}/themes.yml"]

    attr_accessor :name,
                  :color,
                  :colors,
                  :background,
                  :title_size,
                  :title_color,
                  :legend_size,
                  :legend_color,
                  :key_size,
                  :x_size,
                  :x_color,
                  :y_size,
                  :y_color,
                  :grid_color,
                  :rounded,
                  :animated
    
    def self.load(theme_name)
      theme = new(theme_name)
    end
    
    def self.theme_files
      @@theme_files
    end
    
    # Allows you to specify paths for custom theme files in YAML format
    def self.add_theme_file(file)
      @@theme_files << file
    end
    
    def initialize(theme_name)
      themes = {}
      @@theme_files.each {|f| themes.update YAML::load(File.open(f))}
      @name = theme_name.to_s
      theme = themes[theme_name.to_sym]
      if theme
        theme.keys.each do |key|
          self.send("#{key}=", theme[key]) if self.respond_to?("#{key}=")
        end
        self
      else
        raise(ThemeNotFound, "Could not locate the #{theme_name} theme ...")
      end
    end
    
    def to_chart_options
      {
        :theme => name,
        :color => color,
        :colors => colors,
        :background_color => background,
        :title_color => title_color,
        :title_size => title_size,
        :x_legend_color => legend_color,
        :x_legend_size => legend_size,
        :y_legend_color => legend_color,
        :y_legend_size => legend_size,
        :x_key_size => key_size,
        :x_label_color => x_color,
        :x_label_size => x_size,
        :y_label_color => y_color,
        :y_label_size => y_size,
        :grid_color => grid_color,
        :tip_rounded => rounded,
        :animate_pie => animated,
        :pie_label_color => legend_color,
        :pie_label_size => legend_size
      }.reject{|k,v| v.nil?} # remove nil values
    end
  end
end