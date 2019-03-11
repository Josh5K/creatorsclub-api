module Api
    module V1
        class OrdersController < Api::ApiController
            before_action :authenticate

            def index
                orders = RestClient::Request.execute(
                    method: :get,
                    url: 'https://api.printful.com/orders',
                    headers: {"Authorization" => "Basic #{ENV['printful_api_key']}"}
                )
                orders = JSON.parse orders
                createEvent("orders#index")
                render json: orders
            end
            def create

            end
        end
    end
end