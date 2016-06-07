Rails.application.routes.draw do
  namespace :api, path: '', defaults: {format: 'json'} do
    namespace :v1 do
      resources :users,  only: [:index, :create, :show, :update, :destroy] do
        resources :events, only: [:index] do
          resources :guests, only: [:index]
        end
      end
      resources :events, only: [:index, :create, :show, :update, :destroy]
      resources :guests, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
