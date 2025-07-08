Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/ui_kit", to: "pages#ui_kit"
  resources :vans do
    resources :bookings, only: [:new, :create]
  end

  get "bookings/success", to: "bookings#success", as: "booking_success"

  get "my_bookings", to: "bookings#my_bookings"

  get "my_vans", to: "vans#my_vans"
end
