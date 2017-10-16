Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      [:nogizaka, :keyakizaka, :'hiragana_keyaki'].each do |ns|
        namespace ns do
          resources :members, only: [:index]
          resources :songs, only: [:index]
        end
      end
    end
  end
end
