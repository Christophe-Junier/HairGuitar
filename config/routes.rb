# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :bookings, except: [:destroy] do
    resources :pros, only: [:new, :create], controller: "bookings/pros"
  end

end
