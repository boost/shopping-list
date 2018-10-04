# frozen_string_literal: true

namespace :slack do
  desc 'Simulates slack'
  task terminal: :environment do
    puts 'Enter user name as in slack'
    user_name = gets.chomp

    p "simulating slack for @#{user_name}"
  end
end
