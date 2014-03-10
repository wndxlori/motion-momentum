module Momentum
  module ViewControllerModule
    
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      %w(view delegate stylesheet).each do |class_helper_method|
        define_method class_helper_method.to_sym do |class_string|
          send :define_method, "#{class_helper_method}_class".to_sym do
            if Object.const_defined? class_string
              Object.const_get class_string
            else
              puts "[Momentum Warning] ::: The #{class_helper_method} class #{class_string} does not exist, you attempted to use it in #{self.class}"
            end
          end
        end
      end

      def title(title)
        send :define_method, :class_title do
          title
        end
      end
    end

    attr_accessor :delegate, :delegate_class, :view_class, :stylesheet_class, :class_title

    def init
      super
      self.view_class = find_related_class('View')
      self.delegate_class = find_related_class('Delegate')
      self.stylesheet_class = find_related_class('Stylesheet')
      self
    end

    def loadView
      self.view = self.view_class.new
      self.delegate = self.delegate_class.new
      self.view.delegate = self.delegate if self.view.class.instance_methods.include?(:delegate)
      self.view.dataSource = self.delegate if self.view.class.instance_methods.include?(:dataSource)
    end

    def viewDidLoad
      super
      self.setup if self.class.instance_methods.include?(:setup)
    end

    def title
      super || class_title
    end

    private

    def find_related_class(type)
      class_string = self.class.to_s.gsub('Controller', type)
      if Object.const_defined? class_string
        Object.const_get class_string
      end
    end
  end
end