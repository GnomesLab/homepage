# encoding: UTF-8

Homepage::Application.routes.draw do
  # Static single pages
  get 'about',          :to => 'static_pages#about_us', :as => 'about_us'
  get 'services',       :to => 'static_pages#services'

  # Users
  devise_for :users, :skip => [:passwords, :registrations]

  # Contact
  get 'contact',        :to => 'enquiries#new'
  resources :enquiries

  # Blog
  get 'blog', :to => 'posts#index'

  get 'blog/:year/:month/:id' => 'posts#show',
    :as => 'friendly_post_show',
    :constraints => { :year => /\d{4}/,
                      :month => /(0[1-9]|1[012])/,
                      :id => /\S+/ }

  get 'blog/:year(/:month)' => 'posts#published_at',
    :as => "post_published_at",
    :constraints => { :year => /\d{4}/, :month => /(0[1-9]|1[012])/ }

  get 'posts/tagged/:tag_name' => 'posts#tagged', :as => "post_tags"

  resources :posts do
    resources :comments
  end

  # Root path
  root :to => "static_pages#home"
end
