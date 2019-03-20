# frozen_string_literal: true

module Api
  module V1
    class EventsController < Api::ApiController
      before_action :authenticate

      def index
        events = Event.all
        createEvent('events#index')
        render status: 200, json: { message: events }
      end
    end
  end
end
