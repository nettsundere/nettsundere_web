module Pages
  module Admin
    module AdminPageHelper
      def suitable_bootstrap_class_for(message_key)
        case message_key
          when :notice
            "alert-success"
          when :info
            "alert-info"
          when :error
            "alert-error"
        end
      end
    end
  end
end
