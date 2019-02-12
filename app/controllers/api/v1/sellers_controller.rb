module Api
    module V1
        class SellersController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index
                sellers = Seller.all
                render status: 200, json: { message: sellers }
            end
            def show
                seller = Seller.where(:category => params[:id])
                render status: 200, json: { message: seller }
            end
            def link
                seller = Seller.where(:category => request.headers['seller']).first
                user = User.where(:username => request.headers['username']).first

                seller.users << user
                render status: 200, json: { message: seller.as_json(:include => :users) }
            end
        end
    end
end