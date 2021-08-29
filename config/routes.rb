Rails.application.routes.draw do
  resources :mappings do
    collection do
      patch :batch_update
    end
  end

  resources :partners do
    resources :mappings, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
