class RecipeAuthor < ApplicationRecord
  belongs_to :recipe
  belongs_to :author

  #do not need to validate presence as recipe can have 0 authors or author can have 0 recipes.

  def show
    @recipe_author = RecipeAuthor.find(params[:id])
  end
end
