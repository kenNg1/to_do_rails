Rails.application.routes.draw do
  root :to => 'lists#index'

  resources :lists do
    resources :tasks, :except => [:show,:index] do
    end
  end

  # resources :lists do
  #   get 'search', to: 'lists#search'
  # end

# see resource regarding collection in routes http://stackoverflow.com/questions/3028653/difference-between-collection-route-and-member-route-in-ruby-on-rails

  resources :tasks do
    get 'mark_done', to: 'tasks#mark_done'
    collection do
      put :complete
    end
  end

end
