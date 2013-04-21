TransitoSp::Application.routes.draw do
  resources :traffic, as: "transito", only: :index

  # Backward compatibility for the dashboard widget
  match "/update" => 'traffic#index', format: 'json'

  root :to => 'traffic#index'
end
