Rails.application.routes.draw do
  get 'authorization', to: "welcome#authorization", as: 'authorization'
  root 'welcome#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
