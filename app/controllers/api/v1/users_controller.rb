module Api
    module V1
        class UsersController < ApplicationController
            def index
                exclude_columns = ['password']
                columns = User.attribute_names - exclude_columns
                users = User.select(columns).all
                render status: 200, json: { message: users }
            end
            def show
                exclude_columns = ['password']
                columns = User.attribute_names - exclude_columns
                email =  Base64.urlsafe_decode64(params[:id])
                user = User.select(columns).where(:email => email)
                puts user
                render status: 200, json: { message: user }
            end
            def sellers
                users = Seller.Where(category => params[:category]).user
                render status: 200, json: { message: users }
            end
        end
    end
end