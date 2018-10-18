# frozen_string_literal: true

module Slack
  # All requests from slack are handled here
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      ExecuteSlackRequestJob.perform_later(order_params.to_hash)

      head :ok
    end

    private

    def order_params
      params.permit(:text, :user_name, :response_url)
    end
  end
end
