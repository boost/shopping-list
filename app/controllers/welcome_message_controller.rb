# frozen_string_literal: true

class WelcomeMessageController < ApplicationController
  def index
    render json: WelcomMessage.first.to_json
  end
end
