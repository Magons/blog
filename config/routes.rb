Rails.application.routes.draw do
  get 'ip_addresses/index'

  resources :posts, only: [:index, :create] do
    put 'vote', on: :member
  end
end
