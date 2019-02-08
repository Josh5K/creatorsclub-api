module Api
    module V1
        class ProductsController < ApplicationController
            def index
                products = Product.all
                render status: 200, json: { message: products }
            end
        end
    end
end