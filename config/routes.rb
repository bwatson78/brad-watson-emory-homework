# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#home'
  devise_for :authors
  resources :authors, only: [:index, :show]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
