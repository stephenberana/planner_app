Rails.application.routes.draw do
  devise_for :users
  root "tasks#index"

  resources :users 
  resources :tasks 
  # :collection => {:filter => :get}
  resources :categories

  get 'tasks/filter' => 'tasks#filter', :as => :filter_tasks

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
