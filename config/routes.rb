Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    resources :posts, only: [:index]
  end

  root 'application#index'
  get '(*params)', to: 'application#index'
end