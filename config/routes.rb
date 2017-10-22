Rails.application.routes.draw do
  namespace :api do
    [:nogizaka, :keyakizaka, :'hiragana_keyaki'].each do |ns|
      namespace ns do
        resources :members, only: [:index]
        resources :songs, only: [:index]
      end
    end

  end
  resources :apidocs, only: [:index]
end
