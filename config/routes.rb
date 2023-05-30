Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/ingest-recipes', to: 'recipes#ingest_recipe', as: :ingest_recipe
    end
  end
end
