Rails.application.routes.draw do
  get 'choices/new'
  get 'quizzes/new'
  get 'quiz_collections/new'
  get 'quiz_collections/index'
  root 'static_pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
