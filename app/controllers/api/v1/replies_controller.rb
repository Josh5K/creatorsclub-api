# frozen_string_literal: true

module Api
  module V1
    class RepliesController < Api::ApiController
      before_action :authenticate

      def index
        replies = Reply.all
        createEvent('replies#index')
        render json: replies
      end
    end
  end
end
