class ShoppingList < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, length: { minimum: 5 }

  before_save :downcase_name

  def downcase_name
    name.downcase!
  end
end
