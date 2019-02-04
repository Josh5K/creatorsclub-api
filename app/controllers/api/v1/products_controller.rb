module Api
    module V1
        class ProductsController < ApplicationController
            def index
                products = RestClient::Request.execute(
                    method: :get,
                    url: 'https://api.printful.com/products',
                    headers: {"Authorization" => "Basic #{ENV['printful_api_key']}"}
                )
                products = JSON.parse products
                render json: products
            end
        end
    end
end