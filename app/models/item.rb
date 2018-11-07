# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :shopping_list
  validates :name, presence: true, length: { minimum: 3 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
