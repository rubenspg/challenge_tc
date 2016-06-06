Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      devise_for :users do
        resources :events do
          resources :guests
        end
      end
      resources :events do
        resources :guests
      end
    end
  end
end
