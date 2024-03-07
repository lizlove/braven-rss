Rails.application.routes.draw do
  # Set list of channels as homepage
  root "channels#index"
  # Alternately show this on the channels url
  get "/channels", to: "channels#index"
  get "channels/:id", to: "channels#show", as: :channel

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end