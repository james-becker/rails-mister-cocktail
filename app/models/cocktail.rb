class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses # Important to notice when setting up schema
  has_many :doses, dependent: :destroy
  accepts_nested_attributes_for :doses

  validates :name, uniqueness: true, presence: true
end
