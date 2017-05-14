Rails.application.routes.draw do
  root :to => 'lists#index'

  resources :lists do
    resources :tasks, :except => [:show,:index] do
    end
  end

  # resources :lists do
  #   get 'search', to: 'lists#search'
  # end

  resources :tasks do
    get 'mark_done', to: 'tasks#mark_done'
  end

end
