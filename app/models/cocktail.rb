class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy

  has_one_attached :cover_image

  accepts_nested_attributes_for :doses
end
