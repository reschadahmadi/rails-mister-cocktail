class Dose < ApplicationRecord
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }

  belongs_to :ingredient, required: true
  belongs_to :cocktail, required: true
end
