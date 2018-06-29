Rails.application.routes.draw do
  resources :users
  root 'users#home'
  get '/login' => 'users#login'
  get '/account/:id' =>'users#account'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
