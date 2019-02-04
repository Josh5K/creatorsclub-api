module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.all
                render status: 200, json: { message: users }
            end
        end
    end
end