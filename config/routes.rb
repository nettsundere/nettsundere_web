NettsundereWeb::Application.routes.draw do
  extend Localization::Routes
  scope :module => :pages do
    scope "(:locale)", :locale => explicit_locale_regexp do
      root :to => "welcome#show"

      resources :things, :only => [:index, :show]
      
      namespace :admin do
        root :to => "dashboard#show"

        resources :contents, :except => [:show]
        resources :things, :except => [:show]
      end

      match ':id' => "contents#show"
    end
  end
end
