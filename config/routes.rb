Workplace::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "users/registrations" }
  resources :services, expect: :show
  resources :places, except: :show
  resources :users, only: :show
  resources :providers, only: [:create, :destroy]
  resources :countries, except: :show
  resources :cities, except: :show
  resources :posts, except: :index
  resources :workstations, except: :show
  resources :masters, only: [:index, :show, :edit, :update]
  resources :reservations, only: :index
  resources :promos
  resources :events do
    resources :event_users, path: "users", only: [:index, :create, :destroy]
  end

  get "/about" => "home#about", as: :about
  get "/help" => "home#help", as: :help

  root to: "home#index"
end
