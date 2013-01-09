module Localization
  module Model
    class << self
      def included(base)
        base.send(:include, InstanceMethods)
        base.send(:extend, ClassMethods)

        base.class_eval do
          scope :version, lambda { |locale| where(locale => true) }
          scope :localized, lambda { version(I18n.locale) }
        end
      end
    end

    module InstanceMethods
      def method_missing(method, *args, &block)
        possible_method = self.class.localized_name(method)
        if(respond_to?(possible_method))
          params = block ? [*args, block] : args
          send(possible_method, *params)
        else
          super
        end
      end

      def respond_to?(method, include_private = false)
        super || super(self.class.localized_name(method), include_private)
      end
    end

    module ClassMethods
      def localized_name(method, locale = I18n.locale)
        [method, locale].join('_').intern
      end
    end
  end
end
