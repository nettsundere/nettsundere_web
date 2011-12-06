module Helpers
  module A 
    def a_if_not(page_name, a_title, a_options = {})
      if page_name != page
        haml "%a{#{a_options}}#{a_title}"
      else
        haml "%span.current #{a_title}"
      end
    end
  end
end
