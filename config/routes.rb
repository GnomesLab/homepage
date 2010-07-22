Homepage::Application.routes.draw do |map|
  get 'about',          :to => 'static_pages#about'
  get 'services',       :to => 'static_pages#services'
  get 'projects',       :to => 'static_pages#projects'
  get 'blog',           :to => 'static_pages#blog'
  get 'service_detail', :to => 'static_pages#service_detail'
  get 'post_view',      :to => 'static_pages#post_view'
  get 'post_create',    :to => 'static_pages#post_create'
  get 'project_detail', :to => 'static_pages#project_detail'
  get 'sitemap',        :to => 'static_pages#sitemap'

  root :to => "static_pages#homepage"
end
