class CreateRecipeDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_details do |t|
      t.references :recipe, null: false, foreign_key: true
      t.integer :servings
      t.string :difficulty
      t.string :cook_time

      t.timestamps
    end
  end
end
