module Api
    module V1
        class CommentsController < ApplicationController
            def index
                comments = Comment.all
                render json: comments
            end
            def show
                comments = Comment.where(:user => params[:user]);
                render json: comments
            end
        end
    end
end