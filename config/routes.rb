# frozen_string_literal: true

Rails.application.routes.draw do
  get 'about/index'
  root 'articles#index'

  resources :articles do
    resources :comments
  end
end
