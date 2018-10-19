# frozen_string_literal: true

namespace :slack do
  desc 'Simulates slack'
  task terminal: :environment do
    puts 'Enter user slack name'
    user_name = STDIN.gets.chomp

    p "simulating slack for @#{user_name}"

    puts 'Enter slack message for /yum'
    text = STDIN.gets.chomp

    url = 'https://shopping.cloud.boost.co.nz/slack/orders'
    # url = 'http://localhost:3000/slack/orders'

    RestClient::Request.execute(method: :post, url: url,
                                payload: { user_name: user_name, text: text, response_url: nil })
  end
end
