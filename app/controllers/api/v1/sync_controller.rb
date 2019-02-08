module Api
    module V1
        class SyncController < ApplicationController
            def products
                products = RestClient::Request.execute(
                    method: :get,
                    url: 'https://api.printful.com/store/products',
                    headers: {"Authorization" => "Basic #{ENV['printful_api_key']}"}
                )
                products = JSON.parse products
                products['result'].each do |product|
                    existingProduct = Product.where(:printful_id => product['id'])
                    if existingProduct.Count != 0
                        p = Product.new
                        p.printful_id = product['id']
                        p.name = product['name']
                        p.save
                    else
                        existingProduct.name = product['name']
                        existingProduct.save
                    end
                end
            end
            def varients
                products = Product.all

                products.each do |product|
                    variants = RestClient::Request.execute(
                    method: :get,
                    url: "https://api.printful.com/store/products/#{product.printful_id}",
                    headers: {"Authorization" => "Basic #{ENV['printful_api_key']}"}
                    )

                    variants['sync_variants'].each do |variant|
                        existingVariant = Variant.Where(:printful_variant_id => variant['id'])
                        if existingVariant.count != 0
                            v = Variant.new
                            v.printful_varient_id = variant['id']
                            v.name = variant['name']
                            v.image = variant['Files'][1]['preview_url']
                            v.cc_price = variant['retail_price']
                            v.seller_price = variant['retail_price']
                            product.variant << v
                        else
                            existingProduct.printful_varient_id = variant['id']
                            existingProduct.name = variant['name']
                            existingProduct.image = variant['Files'][1]['preview_url']
                            existingProduct.cc_price = variant['retail_price']
                        end
                    end
                end
            end
        end
    end
end