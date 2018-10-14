Rails.application.routes.draw do
  namespace :api do
    get '/words' => 'words#index'
    get '/thoughts' => 'thoughts#index'
    get '/practices' => 'practices#index'


    post '/thoughts' => 'thoughts#create'
    post '/practices' => 'practices#create'
    post "/sessions" => "sessions#create"
    post '/users' => 'users#create'

    get '/practices/:id' => 'practices#show'
    get '/users/:id' => 'users#show'

    patch '/practices' => 'practices#update'
  end
end
