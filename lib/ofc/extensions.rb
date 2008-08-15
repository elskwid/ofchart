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

end
