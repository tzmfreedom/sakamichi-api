Rails.application.routes.draw do
  [:nogizaka, :keyakizaka, :'hiragana_keyaki'].each do |ns|
    namespace ns do
      resources :members, only: [:index]
      resources :songs, only: [:index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
