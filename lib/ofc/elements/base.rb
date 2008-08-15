module Ofc
  class Elements
    
    # Base element
    # :values : array ([])
    class Base
      attr_accessor :options
      attr_accessor :values
      
      def initialize(options={})
        set_options_attributes(options)
        @values =[]
      end

      private
        # So we can pass in a hash of values for defined attributes
        def set_options_attributes(opts={})
          @options = opts
          if opts.kind_of? Hash
            opts.each{ |k,v| self.send(k.to_sym,v) if self.respond_to? k.to_sym }
          end
        end

    end
    
  end
end
