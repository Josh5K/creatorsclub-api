module Api
    module V1
        class Api::ApiController < ActionController::Base
            private

            def authenticate
                api_key = request.headers['X-Api-Key']
                @AdminUser = AdminUser.where(api_key: api_key).first if api_key

                unless @AdminUser
                    createEvent("Invalid API_KEY")
                    render status: 403, json: { message: "unauthorized" }
                end
            end

            def createEvent(name)
                api_key = request.headers['X-Api-Key']
                # if @AdminUser.present?
                #     api_key = @AdminUser.api_key
                # end
                Event.create!(name: name, api_key_used: api_key, ip_address: request.remote_ip)
            end

        end
    end
end
