require 'csv'

Author.destroy_all
Category.destroy_all
Tag.destroy_all
Recipe.destroy_all
RecipeDetail.destroy_all
RecipeAuthor.destroy_all
RecipeTag.destroy_all
Ingredient.destroy_all

#Title,Directions,Quantity,Unit01,Ingredient01,Quantity02,Unit02,Ingredient02,Quantity03,Unit03,Ingredient03,Quantity04,Unit04,Ingredient04,Quantity05,Unit05,Ingredient05,Quantity06,Unit06,Ingredient06,Quantity07,Unit07,Ingredient07,Quantity08,Unit08,Ingredient08,Quantity09,Unit09,Ingredient09,Quantity10,Unit10,Ingredient10,Quantity11,Unit11,Ingredient11,Quantity12,Unit12,Ingredient12,Quantity13,Unit13,Ingredient13,Quantity14,Unit14,Ingredient14,Quantity15,Unit15,Ingredient15,Quantity16,Unit16,Ingredient16,Quantity17,Unit17,Ingredient17,Quantity18,Unit18,Ingredient18,Quantity19,Unit19,Ingredient19,Category
csv_file = Rails.root.join('db', 'recipes.csv')
csv_data = File.read(csv_file)

recipes = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

recipes.each do |recipe|
  name = recipe['Title']
  description = recipe['Directions']
  categoryName = recipe['Category']
  ingredients = []

  # Find or create the category
  category = Category.find_or_create_by(name: categoryName)
  next if category.blank?

  recipe = Recipe.create(name: name, description: description, category_id: category.id)

  # Collect all ingredients and quantities
  (1..19).each do |i|
    measurement = recipe["Quantity#{format('%02d', i)}"].gsub(/-.*/, '') + " " + recipe["Unit#{format('%02d', i)}"]
    ingredient = recipe["Ingredient#{format('%02d', i)}"]
    Ingredient.create(name: ingredient, measurement: measurement, recipe: recipe.id)
    break if measurement.blank? || ingredient.blank?
  end
end
