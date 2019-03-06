module Api
    module V1
        class ProductsController < ApplicationController

            def initialize(headers = {})
                @headers = headers
            end

            def index
                if params['include'] == 'variants'
                    if @headers['seller'].present?

                    else
                        products = Product.all
                        render status: 200, json: { message: products.as_json(:include => [:variant]) }
                    end
                else
                    products = Product.all
                    render status: 200, json: { message: products }
                end
            end

            def show
                productid = params[:id]
                product = Product.where(:id => productid).first

                render status: 200, json: { product: product.as_json(:include => :variant) }
            end
        end
    end
end