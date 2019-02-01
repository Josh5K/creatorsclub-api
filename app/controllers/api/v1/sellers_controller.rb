module Api
    module V1
        class SellersController < ApplicationController
            def index
                sellers = Seller.all
                render json: sellers
            end
        end
    end
end