class CreateRecipeAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_authors do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
