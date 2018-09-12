class Item < ApplicationRecord
  belongs_to :list
  belongs_to :category
  validates :name, presence: true, length: { minimum: 3 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category_id, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
