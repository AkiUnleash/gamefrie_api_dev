Rails.application.routes.draw do

  resources :diaries do
    collection do
      match '', via: :options, action: 'options'
    end
  end

  resources :profiles
  resources :genders, only: [:index]
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
