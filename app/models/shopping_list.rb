# frozen_string_literal: true

class ShoppingList < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, length: { minimum: 5 }

  before_save :downcase_name

  def self.primary
    find_by(primary: true)
  end

  def downcase_name
    name.downcase!
  end

  def hash_tag
    '#' + name.tr(' ', '_')
  end
end
