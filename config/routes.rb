Rails.application.routes.draw do

  devise_for :admins

  root 'welcome#index'
  get     'contact'   => 'welcome#contact'
  get     'news'      => 'welcome#news'
  get     'about'      => 'welcome#about'

  resources :posts
end
