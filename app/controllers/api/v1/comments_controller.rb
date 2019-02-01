module Api
    module V1
        class CommentsController < ApplicationController
            def index
                comments = Comment.all
                render json: comments
            end
        end
    end
end