Homepage::Application.routes.draw do |map|
  devise_for :users, :skip => [:passwords, :registrations]

  get 'about',          :to => 'static_pages#about_us', :as => 'about_us'
  get 'services',       :to => 'static_pages#services'
  get 'blog',           :to => 'static_pages#blog'
  get 'service_detail', :to => 'static_pages#service_detail'
  get 'post_view',      :to => 'static_pages#post_view'
  get 'post_create',    :to => 'static_pages#post_create'
  get 'project_detail', :to => 'static_pages#project_detail'
  get 'sitemap',        :to => 'static_pages#sitemap'
  get 'contact',        :to => 'enquiries#new'

  resources :enquiries
  resources :projects

  root :to => "static_pages#home"
end
