class Recipe < ApplicationRecord
  belongs_to :category

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  has_many :recipe_authors
  has_many :authors, through: :recipe_authors

  has_many :ingredients

  has_one :recipe_detail

  def index
    @recipes = Recipe.includes(:recipe_detail, :recipe_author, :recipe_tag, :ingredient).all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
