class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true

  def show
    @ingredient = Ingredient.find(params[:id])
  end
end
