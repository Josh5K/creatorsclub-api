# frozen_string_literal: true

module Api
  module V1
    class SellersController < Api::ApiController
      skip_before_action :verify_authenticity_token
      before_action :authenticate

      def index
        sellers = Seller.all
        createEvent('sellers#index')
        render status: 200, json: { message: sellers.as_json(include: :users) }
      end

      def show
        seller = Seller.where(category: params[:id]).first
        createEvent('sellers#show')
        render status: 200, json: { seller: seller, products: seller.product.as_json(include: :variant) }
      end

      def link
        seller = Seller.where(category: request.headers['seller']).first
        user = User.where(username: request.headers['username']).first

        seller.users << user
        createEvent('seller#link')
        render status: 200, json: { message: seller.as_json(include: :users) }
      end
    end
  end
end
