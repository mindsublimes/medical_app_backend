Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :members do
        member do
          get 'uploads', to: 'members#show'
        end
      end
      resources :opportunities do
        member do
          put :stage_history
        end
      end
      get '/search', to: 'search#search'
    end
  end
end
