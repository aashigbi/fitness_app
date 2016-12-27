Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get 'users/food/:id' => 'users#food', as: 'users_food'

  get 'users/home/:id' => 'users#home', as: 'users_home'

  get 'foods/index' => 'foods#index', as:'food_lookup'

  get 'foods/:id/edit' => 'foods#edit', as:'food'

  get 'foods/:id/add' => 'foods#add', as:'add_food'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'

  resources :users
  resources :foods

end
