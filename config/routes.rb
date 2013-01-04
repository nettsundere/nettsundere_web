NettsundereWeb::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  extend Localization::Routes
  scope :module => :pages do
    scope "(:locale)", :locale => explicit_locale_regexp do
      root :to => "welcome#show"

      resources :things, :only => [:index, :show]
      
      resource :session, :only => [:new, :create, :destroy]

      namespace :admin do
        root :to => "dashboard#show"

        with_options :except => [:show] do |map|
          map.resources :contents
          map.resources :things
          map.resources :users
          map.resources :repositories
        end
      end

      match ':id' => "contents#show"
    end
  end
end
