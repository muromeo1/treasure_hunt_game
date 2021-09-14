Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          get 'authenticate', to: 'authenticate'
        end
      end

      post 'treasure_hunt', to: 'destinations#check_arrival'
    end
  end
end
