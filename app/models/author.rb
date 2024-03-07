class Author < ApplicationRecord
  has_many :recipe_authors
  has_many :recipes, through: :recipe_authors

  validates :name, presence: true, uniqueness: true

end
