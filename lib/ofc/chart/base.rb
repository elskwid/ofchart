module Ofc

  class Chart
    
    # Base class used for chart items
    class Base
      attr_accessor :options
    
      def initialize(options={})
        set_options_attributes(options)
      end
    
      private
        # So we can pass in a hash of values for defined attributes
        def set_options_attributes(opts={})
          @options = opts
          if opts.kind_of? Hash
            opts.each do |k,v| 
              self.send("#{k.to_sym}=",v) if self.respond_to? k.to_sym
            end
          end
        end
        
    end
    
  end
end
