Etote::Application.routes.draw do

  resources :categories do
    resources :documents, :shallow => true
  end

  namespace :api do
    root :to => 'api_root#index'
    namespace :v1 do
      root :to => 'root#index'
      resources :categories, :only => :index
      resources :totes, :only => :create
      match 'report' => 'totes#index', :via => :get
    end
  end
end
