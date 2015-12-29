Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins

  root 'welcome#index'
  get     'contact'   => 'welcome#contact'
  get     'news'      => 'welcome#news'
  get     'about'      => 'welcome#about'

  resources :posts
  resources :terms do
    get :autocomplete_term_phrase, :on => :collection
  end

end
