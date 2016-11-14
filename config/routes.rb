Rails.application.routes.draw do
  get 'admins/staff'

  get 'admins/categories'

  get 'admins/menu'

  get 'admins/home'

  get 'admins/stats'

  get 'admins/settings'

  get 'admins/tables'

  get 'admins/login'

  get 'tables/welcome'

  get 'tables/home'

  get 'waiters/login'

  get 'waiters/tables'

  root 'tables#welcome'

  post 'tables/redirect_to_table' => 'tables#redirect_to_table'

  delete 'sign_out' => 'sessions#destroy'
  delete 'admin_sign_out' => 'admin_sessions#destroy'

  get "waiters/tables_calling"

  resources :tables do
    post :toggle_request, on: :member
  	resources :clients do
  		post :add_dish, on: :member
  	end
  end

  resources :admins
  resources :waiters
	resources :sessions
	resources :admin_sessions
  resources :categories do
  	resources :dishes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
