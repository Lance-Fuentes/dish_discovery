class Author < ApplicationRecord
  has_many :recipe_authors
  has_many :recipes, through: :recipe_authors

  validates :name, presence: true

  def show
    @author = Author.find(params[:id])
  end
end
