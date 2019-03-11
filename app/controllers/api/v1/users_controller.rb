module Api
    module V1
        class UsersController < Api::ApiController
            skip_before_action :verify_authenticity_token
            before_action :authenticate

            def index
                exclude_columns = ['password', 'password_digest']
                columns = User.attribute_names - exclude_columns
                users = User.select(columns).all
                createEvent("user#index")
                if params['include'] = 'sellers'
                    render status: 200, json: { message: users.as_json(:include => :sellers) }
                else
                    render status: 200, json: { message: users }
                end
            end

            def show
                exclude_columns = ['password', 'password_digest']
                columns = User.attribute_names - exclude_columns
                email =  Base64.urlsafe_decode64(params[:id])
                user = User.select(columns).where(:email => email)
                createEvent("user#show/#{email}")
                if params['include'] == 'sellers'
                    render status: 200, json: { message: user.as_json(:include => :sellers) }
                else
                    render status: 200, json: { message: user }
                end
            end

            def signin
                user = User.where(:email => request.headers['email'])
                if user.count == 1 && user[0].authenticate(request.headers['password'])
                    createEvent("user#signin - Successful")
                    render status: 200, json: { message: "Login Successful" }
                else
                    createEvent("user#signin - Error")
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
                    createEvent("user#create - Successful")
                    render status: 200, json: { message: "User Created!" }
                else
                    createEvent("user#create - Error")
                    render status: 500, json: "ERROR HTTP 500"
                end
            end

            def update
                exclude_columns = ['password', 'password_digest']
                columns = User.attribute_names - exclude_columns
                u = User.select(columns).where(:username => params[:username]).first
                if request.headers['email'].present?
                    u.email = request.headers['email']
                end
                if request.headers['profile_picture'].present?
                    u.profile_picture = request.headers['profile_picture']
                end
                if request.headers['youtube'].present?
                    u.youtube = request.headers['youtube']
                end
                if request.headers['twitter'].present?
                    u.twitter = request.headers['twitter']
                end
                if request.headers['facebook'].present?
                    u.facebook = request.headers['facebook']
                end
                if request.headers['about'].present?
                    u.about = request.headers['about']
                end
                if request.headers['password'].present?
                    u.password = request.headers['password']
                end
                if u.save
                    createEvent("user#update - Successful")
                    render status: 200, json: { message: "#{u.username} has been updated!"}
                else
                    createEvent("user#update - Error")
                    render status: 500, json: { message: "Error updating user" }
                end
            end
        end
    end
end