module Api
    module V1
        class UsersController < ApplicationController
            skip_before_action :verify_authenticity_token

            def index
                exclude_columns = ['password']
                columns = User.attribute_names - exclude_columns
                users = User.select(columns).all
                if params['include'] = 'sellers'
                    render status: 200, json: { message: user.as_json(:include => :sellers) }
                else
                    render status: 200, json: { message: users }
                end
            end

            def show
                exclude_columns = ['password']
                columns = User.attribute_names - exclude_columns
                email =  Base64.urlsafe_decode64(params[:id])
                user = User.select(columns).where(:email => email)
                if params['include'] == 'sellers'
                    render status: 200, json: { message: user.as_json(:include => :sellers) }
                else
                    render status: 200, json: { message: user }
                end
            end

            def signin
                user = User.where(:email => request.headers['email'])
                if user.count == 1 && user[0].authenticate(request.headers['password'])
                    render status: 200, json: { message: "Login Successful" }
                else
                    render status: 401, json: { message: "HTTP 401" }
                end
            end

            def create
                u = User.create
                u.username = request.headers['username']
                u.email = request.headers['email']
                u.profile_picture = request.headers['profile_picture']
                u.youtube = request.headers['youtube']
                u.twitter = request.headers['twitter']
                u.facebook = request.headers['facebook']
                u.twitch = request.headers['twitch']
                u.about = request.headers['about']
                u.password = request.headers['password']
                if u.save
                    render status: 200, json: { message: u }
                else
                    render status: 500, json: "ERROR HTTP 500"
                end
            end


        end
    end
end