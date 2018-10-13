Rails.application.routes.draw do
  namespace :api do
    get '/words' => 'words#index'

    post '/thoughts' => 'thoughts#create'
    get '/thoughts' => 'thoughts#index'

    post '/practices' => 'practices#create'

    get '/practices' => 'practices#index'
    get '/practices/:id' => 'practices#show'

    patch "/practices/:id" => 'practices#update'
  end
end
