# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :pros, except: [:destroy]
  resources :bookings, except: [:destroy]

  namespace :pros do
    resources :bookings, except: [:destroy]
  end
end
