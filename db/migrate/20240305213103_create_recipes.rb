class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
