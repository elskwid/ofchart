module Ofc
  
  class Chart

    # Base class used for chart items
    class Base
      include Ofc::HashedAttributes
      include Ofc::JSON
      
      # Anything?
      def initialize(options={})
        super
      end
      
    end
    
  end
end
