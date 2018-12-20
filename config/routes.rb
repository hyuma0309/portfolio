Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  resources :titles
  
  root to:'titles#index'
  get 'titles/detail/:id', to: 'titles#detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'bookmarks', to: 'bookmarks#create'
  delete 'bookmarks', to: 'bookmarks#destroy'
  get 'bookmarks', to: 'bookmarks#index'
  get 'after_login_to_add_bookmark', to: 'bookmarks#after_login_to_add_bookmark'
end
