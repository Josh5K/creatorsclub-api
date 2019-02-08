module Api
    module V1
        class SellersController < ApplicationController
            def index
                sellers = Seller.all
                render status: 200, json: { message: sellers }
            end
            def show

            end
        end
    end
end