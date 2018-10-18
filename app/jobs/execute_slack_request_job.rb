# frozen_string_literal: true

class ExecuteSlackRequestJob < ApplicationJob
  queue_as :default

  def perform(args)
    Yum::Yummify.new(args).call
  end
end
