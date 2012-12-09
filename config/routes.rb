NettsundereWeb::Application.routes.draw do

  POSSIBLE_EXPLICIT_LOCALES = /en/

  scope :module => :pages do
    scope "(:locale)", :locale => POSSIBLE_EXPLICIT_LOCALES do
      root :to => "welcome#show"
    end
  end
end
