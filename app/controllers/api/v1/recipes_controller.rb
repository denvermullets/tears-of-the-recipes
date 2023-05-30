module Api
  module V1
    class RecipesController < ApplicationController
      def index
        render json: Recipe.all
      end

      def ingest_recipe
        Scrape::Ingredients.call
      end
    end
  end
end
