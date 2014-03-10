module Momentum
  module DelegateModule

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
    end

    attr_accessor :data

    def initialize
      self.data = {}
    end

  end
end