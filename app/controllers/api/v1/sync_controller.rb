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

                    category = product['name'][0...6]
                    seller = Seller.where(:category => category)
                    if seller.count == 1
                        existingProduct = Product.where(:printful_id => product['id'])
                        if existingProduct.count == 0
                            p = Product.new
                            p.printful_id = product['id']
                            p.name = product['name'][9...1000]
                            p.seller = seller[0]
                            p.save
                        elsif existingProduct == 1
                            existingProduct[0].name = product['name']
                            existingProduct[0].save
                        end
                    end
                end
                render status: 200, json: { message: "Product Sync Completed!" }
            end
            def variants
                products = Product.all

                products.each do |product|
                    variants = RestClient::Request.execute(
                    method: :get,
                    url: "https://api.printful.com/store/products/#{product.printful_id}",
                    headers: {"Authorization" => "Basic #{ENV['printful_api_key']}"}
                    )

                    variants = JSON.parse variants

                    variants['result']['sync_variants'].each do |variant|
                        existingVariant = Variant.where(:printful_variant_id => variant['id'])
                        if existingVariant.count == 0
                            v = Variant.new
                            v.printful_variant_id = variant['id']
                            v.name = variant['name'][9...1000]
                            v.image = variant['files'][1]['preview_url']
                            v.cc_price = variant['retail_price']
                            v.seller_price = variant['retail_price']
                            product.variant << v
                        elsif existingVariant.count == 1
                            existingVariant.printful_variant_id = variant['id']
                            existingVariant.name = variant['name']
                            existingVariant.image = variant['Files'][1]['preview_url']
                            existingVariant.cc_price = variant['retail_price']
                        end
                    end
                end
                render status: 200, json: { message: "Variant Sync Completed!" }
            end
        end
    end
end