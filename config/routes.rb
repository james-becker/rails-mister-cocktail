Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create] # Important to understand this
  end

  resources :doses, only: [:destroy] # Important to understand this

end
