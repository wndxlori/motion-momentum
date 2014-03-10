module Momentum
  class ViewController < UIViewController
    attr_accessor :view_class, :delegate_class, :stylesheet_class, :delegate

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

    def viewDidAppear(animated)
      self.setup if self.class.instance_methods.include?(:setup)
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