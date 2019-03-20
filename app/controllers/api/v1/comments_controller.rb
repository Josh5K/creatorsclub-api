# frozen_string_literal: true

module Api
  module V1
    class CommentsController < Api::ApiController
      before_action :authenticate

      def index
        comments = Comment.all
        createEvent('comments#index')
        render json: comments
      end

      def show
        comments = Comment.where(user: params[:user])
        createEvent('comments#show')
        render json: comments
      end
    end
  end
end
