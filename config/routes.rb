Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get '/users/goals/:id' => 'users#goals', as:'users_goals'

  get 'users/food' => 'users#food'

  get 'nutrition/display'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  get 'users/home'

  resources :users

end
