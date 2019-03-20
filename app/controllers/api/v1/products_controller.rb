# frozen_string_literal: true

module Api
  module V1
    class ProductsController < Api::ApiController
      before_action :authenticate

      def initialize(headers = {})
        @headers = headers
      end

      def index
        if params['include'] == 'variants'
          if @headers['seller'].present?

          else
            products = Product.all
            render status: 200, json: { message: products.as_json(include: [:variant]) }
          end
        else
          products = Product.all
          render status: 200, json: { message: products }
        end
        createEvent('products#index')
      end

      def show
        productid = params[:id]
        product = Product.where(id: productid).first
        createEvent('products#show')
        render status: 200, json: { product: product.as_json(include: :variant) }
      end
    end
  end
end
