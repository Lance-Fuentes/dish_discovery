class RecipeDetail < ApplicationRecord
  belongs_to :recipe

  validates :servings, :difficulty, :cook_time, presence: true
  validates :servings, numericality: true

  def show
    @recipe_detail = RecipeDetail.find(params[:id])
  end
end
