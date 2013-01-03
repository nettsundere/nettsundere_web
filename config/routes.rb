NettsundereWeb::Application.routes.draw do

  POSSIBLE_EXPLICIT_LOCALES = /en/

  scope :module => :pages do
    scope "(:locale)", :locale => POSSIBLE_EXPLICIT_LOCALES do
      root :to => "welcome#show"

      resources :things, :only => [:index, :show]

      namespace :admin do
        root :to => "dashboard#show"

        resources :things, :except => [:show]
      end
    end
  end
end
