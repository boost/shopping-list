# frozen_string_literal: true

module Slack
  # All requests from slack are handled here
  class OrdersController < ApplicationController
    def create
      Yum::Yummify.new(order_params).call
    end

    private

    def order_params
      params.permit(:text, :user_name, :response_url)
    end
  end
end
