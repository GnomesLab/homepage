Homepage::Application.routes.draw do
  devise_for :users, :skip => [:passwords, :registrations]

  get 'about',          :to => 'static_pages#about_us', :as => 'about_us'
  get 'services',       :to => 'static_pages#services'
  get 'blog',           :to => 'posts#index'
  get 'service_detail', :to => 'static_pages#service_detail'
  get 'post_view',      :to => 'posts#show'
  get 'post_create',    :to => 'posts#new'
  get 'project_detail', :to => 'static_pages#project_detail'
  get 'sitemap',        :to => 'static_pages#sitemap'
  get 'contact',        :to => 'enquiries#new'

  resources :enquiries
  resources :posts

  get '/projects/:category_id/:project_id' => 'projects#show', :as => :project
  get '/projects/:category_id' => 'categories#show', :as => :category
  get '/projects/' => 'projects#index', :as => :projects

  root :to => "static_pages#home"
end
