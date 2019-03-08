module Api
    module V1
        class VariantsController < ApplicationController
            def index
                if request.headers['HTTP_PRODUCT_ID'].present? && request.headers['HTTP_COLOR'].present? && request.headers['HTTP_SIZE'].present?
                    variant = Variant.where(:product_id => request.headers['HTTP_PRODUCT_ID'], :color => request.headers['HTTP_COLOR'], :size => request.headers['HTTP_SIZE'])
                    render status: 200, json: { variant: variant }
                else
                    render status: 400, json: { message: "Missing headers" }
                end
            end
        end
    end
end