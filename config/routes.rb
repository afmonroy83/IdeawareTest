Rails.application.routes.draw do
  get 'images/:id/show', to: 'images#show', as:'show_image'
  get 'listLikes', to: 'images#listLikes', as:'likes'
  get 'authorization', to: "welcome#authorization", as: 'authorization'
  root 'welcome#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
