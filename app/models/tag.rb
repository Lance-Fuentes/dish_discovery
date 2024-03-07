class Tag < ApplicationRecord
  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags

  def show
    @tag = Tag.find(params[:id])
  end
end
