Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :articles
  resource :users
  resource :orders
    get 'users/home' => 'users#home'
    get 'users/login' => 'users#login'
    post 'users/login' => 'users#check'
    get 'users/logout'=> 'users#logout'
    get 'transfert/debit' => 'transferts#debit'
    get 'transfert/credit' => 'transferts#credit'


end
