Etote::Application.routes.draw do
  namespace :api do
    root :to => 'api_root#index'
    namespace :v1 do
      root :to => 'root#index'
      resources :requests, :only => :create
    end
  end
end
