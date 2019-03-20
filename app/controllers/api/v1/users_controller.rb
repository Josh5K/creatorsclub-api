# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::ApiController
      skip_before_action :verify_authenticity_token
      before_action :authenticate

      def index
        exclude_columns = %w[password password_digest]
        columns = User.attribute_names - exclude_columns
        users = User.select(columns).all
        createEvent('user#index')
        if params['include'] = 'sellers'
          render status: 200, json: { message: users.as_json(include: :sellers) }
        else
          render status: 200, json: { message: users }
        end
      end

      def show
        exclude_columns = %w[password password_digest]
        columns = User.attribute_names - exclude_columns
        email = Base64.urlsafe_decode64(params[:id])
        user = User.select(columns).where(email: email)
        createEvent("user#show/#{email}")
        if params['include'] == 'sellers'
          render status: 200, json: { message: user.as_json(include: :sellers) }
        else
          render status: 200, json: { message: user }
        end
      end

      def signin
        user = User.where(email: params['email']).first
        isSeller = !user.sellers[0].nil?
        if user.authenticate(params['password'])
          createEvent('user#signin - Successful')
          render status: 200, json: { message: 'Logged In', seller: isSeller }
        else
          createEvent('user#signin - Error')
          render status: 401, json: { message: 'User failed to authenticate' }
        end
      end

      def create
        u = User.create
        u.username = params['username']
        u.email = params['email']
        u.profile_picture = params['profile_picture']
        u.youtube = params['youtube']
        u.twitter = params['twitter']
        u.facebook = params['facebook']
        u.twitch = params['twitch']
        u.about = params['about']
        u.password = params['password']

        if u.save
          createEvent('user#create - Successful')
          render status: 200, json: { message: 'User Created!' }
        else
          createEvent('user#create - Error')
          render status: 500, json: 'ERROR HTTP 500'
        end
      end

      def update
        exclude_columns = %w[password password_digest]
        columns = User.attribute_names - exclude_columns
        u = User.select(columns).where(username: params[:username]).first
        u.email = request.headers['email'] if request.headers['email'].present?
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
        u.about = request.headers['about'] if request.headers['about'].present?
        if request.headers['password'].present?
          u.password = request.headers['password']
        end
        if u.save
          createEvent('user#update - Successful')
          render status: 200, json: { message: "#{u.username} has been updated!" }
        else
          createEvent('user#update - Error')
          render status: 500, json: { message: 'Error updating user' }
        end
      end
    end
  end
end
