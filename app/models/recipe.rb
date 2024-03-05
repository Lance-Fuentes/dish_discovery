class Recipe < ApplicationRecord
  belongs_to :category

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  has_many :recipe_authors
  has_many :authors, through: :recipe_authors

  has_one :recipe_detail
end
