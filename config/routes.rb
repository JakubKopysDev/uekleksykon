Rails.application.routes.draw do

  root 'welcome#index'
  get     'contact'   => 'welcome#contact'
  get     'news'      => 'welcome#news'
  get     'about'      => 'welcome#about'

  resources :posts, only: [:show, :index, :new, :create]
end
