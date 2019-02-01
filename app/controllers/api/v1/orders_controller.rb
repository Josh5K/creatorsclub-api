module Api
    module V1
        class OrdersController < ApplicationController
            def index
                orders = RestClient::Request.execute(
                    method: :get,
                    url: 'https://api.printful.com/orders',
                    headers: {"Authorization" => "Basic #{ENV['printful_api_key']}"}
                )
                orders = JSON.parse orders
                render json: orders
            end
        end
    end
end