Rails.application.routes.draw do
  #post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Home controller routes.
  resources :ldap
  root   'home#index'
  get    'auth'            => 'home#auth'

  # Get login token from Knock
  post   '/user/auth'      => 'user_token#create'

  # User actions
  get    '/users'          => 'users#index'
  get    '/user'           => 'users#check'
  post   '/user'           => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'

  # publis as webservice...
  wash_out :wsusers

end
