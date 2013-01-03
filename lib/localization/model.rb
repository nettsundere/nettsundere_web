module Localization
  module Model

    class << self
      def included(base)
        base.class_eval do 
          scope :version, lambda { |locale| where(locale => true) }
        end
      end
    end

    def method_missing(method, *args, &block)
      possible_method = localized_name_for(method)
      if(respond_to?(possible_method))
        send(possible_method)
      else
        super
      end
    end

    def respond_to?(method, include_private = false)
      super(method, include_private) || super(localized_name_for(method), include_private)
    end

    private
      def localized_name_for(method)
        [method, I18n.locale].join('_')
      end
  end
end
