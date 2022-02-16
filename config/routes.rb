Rails.application.routes.draw do
  # get 'reviews/new',
  # get 'reviews/create'
  # get 'restaurants/index'
  # get 'restaurants/show'
  # get 'restaurants/new'
  # get 'restaurants/create'
  resources :restaurants, only: %i[index show new create] do
    resources :reviews, only: %i[new create]
  end
end
