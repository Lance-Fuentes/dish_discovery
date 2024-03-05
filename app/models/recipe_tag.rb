class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag

  #Do not need to validate RecipeTag zero-to-many association on both sides
end
