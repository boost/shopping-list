class List < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, length: { minimum: 5 }
end
