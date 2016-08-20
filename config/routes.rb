Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get 'users/new'

  get 'users/goals'

  get 'food' => 'static_pages#food'

  resources :users

end
