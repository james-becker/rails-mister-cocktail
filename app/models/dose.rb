class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail, dependent: :destroy

  validates :description, presence: true
  validates_uniqueness_of :ingredient, scope: [:cocktail]
end
