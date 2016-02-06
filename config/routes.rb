Rails.application.routes.draw do  
  resources :comments
  get "home" => "home#index"

  resources :ideas do
    collection do
      get :update_theme_ideas
      get :vote_ideas
      get :delete_ideas
      get :vote_remove
    end
  end
  
  resources :participants
  
  shallow do
    resources :ideation_sessions do
      collection do
        get :set_availability
        get :set_status_votation
      end
      resources :themes
      resources :ideas do
        resources :comments
      end
      resources :participants
    end
  end
  devise_for :users, controllers: { 
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
 
  devise_scope :user do 
    root to: "users/sessions#new"
    get "/users/sign_out" => "devise/sessions#destroy"
    get "/users/sign_in" => "devise/sessions#new"
    post "/users/sign_in" => "devise/sessions#create"
    get "/users/password/new" => "devise/passwords#new"
    get "/users/password/edit" => "devise/passwords#edit"
    post "/users/password" => "devise/passwords#create"
    patch "/users/password" => "devise/passwords#update"
    put "/users/password" => "devise/passwords#update"
  end

  post "ideation_sessions/set_anonymous/:id" => "ideation_sessions#set_anonymous"
  post "ideation_sessions/set_anonymous/:ideation_session_id" => "ideation_sessions#set_anonymous"
  post "ideation_sessions/set_identified/:id" => "ideation_sessions#set_identified"
  post "ideation_sessions/set_identified/:ideation_session_id" => "ideation_sessions#set_identified"

end
