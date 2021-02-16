class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
end
