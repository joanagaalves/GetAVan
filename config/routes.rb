Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "bookings/success", to: "bookings#success", as: "booking_success"

  get "/ui_kit", to: "pages#ui_kit"
  resources :vans do
    resources :bookings, only: [:new, :create]
  end
end
