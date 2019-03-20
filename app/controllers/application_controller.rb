# frozen_string_literal: true

class ApplicationController < ActionController::Base
  @orders = RestClient::Request.execute(
    method: :get,
    url: 'https://api.printful.com/orders',
    headers: { 'Authorization' => "Basic #{ENV['printful_api_key']}" }
  )
  @orders = JSON.parse @orders
  @orders = @orders['result']
end
