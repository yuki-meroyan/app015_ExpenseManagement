Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root to: "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tasks/top', to: 'tasks#top'
  get '/expenses/top', to: 'expenses#top'
  resources :groups, shallow: true do
    resources :tasks, except: [:top]
    resources :expenses, except: [:top]
  end
  resources :users

end
