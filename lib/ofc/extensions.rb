# _why!
class Object
  # The hidden singleton lurks behind everyone
  def metaclass; class << self; self; end; end
  def meta_eval &blk; metaclass.instance_eval &blk; end

  # Adds methods to a metaclass
  def meta_def name, &blk
   meta_eval { define_method name, &blk }
  end

  # Defines an instance method within a class
  def class_def name, &blk
   class_eval { define_method name, &blk }
  end
end
 

class Module
  # From Rails ActiveSupport -->
  # Allows you to make aliases for attributes, which includes 
  # getter, setter, and query methods.
  #
  # Example:
  #
  #   class Content < ActiveRecord::Base
  #     # has a title attribute
  #   end
  #
  #   class Email < Content
  #     alias_attribute :subject, :title
  #   end
  #
  #   e = Email.find(1)
  #   e.title    # => "Superstars"
  #   e.subject  # => "Superstars"
  #   e.subject? # => true
  #   e.subject = "Megastars"
  #   e.title    # => "Megastars"
  def alias_attribute(new_name, old_name)
    module_eval <<-STR, __FILE__, __LINE__+1
      def #{new_name}; self.#{old_name}; end
      def #{new_name}?; self.#{old_name}?; end
      def #{new_name}=(v); self.#{old_name} = v; end
    STR
  end
  
  # Again, Rails ActiveSupport ... Thank you!
  # Modified to allow nils, I want to be able to specifically set something to return nil as the default
  
  # Declare an attribute accessor with an initial default return value.
  #
  # To give attribute <tt>:age</tt> the initial value <tt>25</tt>:
  #  
  #   class Person
  #     attr_accessor_with_default :age, 25
  #   end
  #
  #   some_person.age
  #   => 25
  #   some_person.age = 26
  #   some_person.age
  #   => 26
  #
  # To give attribute <tt>:element_name</tt> a dynamic default value, evaluated
  # in scope of self:
  #
  #   attr_accessor_with_default(:element_name) { name.underscore } 
  #
  def attr_accessor_with_default(sym, default = nil, &block)
    # Removed following line to allow nils.
    # raise 'Default value or block required' unless !default.nil? || block
    define_method(sym, block_given? ? block : Proc.new { default })
    module_eval(<<-EVAL, __FILE__, __LINE__)
      def #{sym}=(value)
        class << self; attr_reader :#{sym} end
        @#{sym} = value
      end
    EVAL
  end
  
  # This one is all me. For good or ill. With thanks to Rails and Why
  def default_chart_attributes(attrs={})
    return @chart_attributes if attrs.empty?
    # chart attributes method
    meta_def :chart_attributes do 
      attrs.keys
    end
    # accessors for the attributes/keys
    attrs.keys.each do |sym|
      module_eval(<<-EVAL, __FILE__, __LINE__)
        def #{sym}; @#{sym}; end
        
        def #{sym}=(value)
          @#{sym} = value
        end
      EVAL
    end
    
    # set the defaults
    class_eval do
      define_method :initialize do |*options|
        super # get the base class if it is there
        attrs.each do |k,v|
          # FIXME: we call dup here, which means that we have one extra class instance defined for every call. Ugh.
          v = v.dup unless %w(NilClass Fixnum TrueClass FalseClass).include? v.class.name 
          instance_variable_set( "@#{k}", v )
        end
        opts = options.first || Hash.new
        opts.each do |k,v| 
          # use send rather than instance_variable so we can get aliased methods/attributes
          self.send("#{k.to_sym}=",v) if self.respond_to? k.to_sym
          # instance_variable_set( "@#{k}", v )            
        end        
      end
    end
    
  end  
  
end
