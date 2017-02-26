class Cocktail < ApplicationRecord
  attr_accessor :cocktails_ingredients

  has_many :ingredients, through: :doses # Important to notice when setting up schema
  has_many :doses, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :doses, allow_destroy: true

  mount_uploader :photo, PhotoUploader

  validates :name, uniqueness: true, presence: true
end
