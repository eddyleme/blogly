Rails.application.routes.draw do
  resources :posts
  root 'sessions#new', as: '/'
  resource :sessions
	resource :users
  get 'users/new'
	delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
