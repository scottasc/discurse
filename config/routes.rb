Rails.application.routes.draw do
  namespace :api do
    get '/words' => 'words#index'

    post '/thoughts' => 'thoughts#create'

    post '/practices' => 'practices#create'

    get '/practices' => 'practices#index'
  end
end
