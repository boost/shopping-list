# frozen_string_literal: true

namespace :slack do
  desc 'Simulates slack'
  task terminal: :environment do
    puts 'Enter user slack name'
    user_name = STDIN.gets.chomp

    p "simulating slack for @#{user_name}"

    puts 'Enter slack message for /yum'
    user_name = STDIN.gets.chomp

    # restclient call to orders route here
  end
end
