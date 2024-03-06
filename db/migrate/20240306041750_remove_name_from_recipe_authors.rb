class RemoveNameFromRecipeAuthors < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipe_authors, :name, :string
  end
end
