Rails.application.routes.draw do
  get 'users/show', as: 'account'

  devise_for :users
	
  resources :categories do
    resources :products do
      resources :reviews
  end
    end


  root 'categories#index'
end
