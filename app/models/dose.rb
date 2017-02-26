class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail, dependent: :destroy

  accepts_nested_attributes_for :ingredient, allow_destroy: false

  validates :description, presence: true
  validates_uniqueness_of :ingredient, scope: [:cocktail]
end
