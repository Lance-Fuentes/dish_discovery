require 'csv'

RecipeDetail.destroy_all
RecipeAuthor.destroy_all
RecipeTag.destroy_all
Ingredient.destroy_all
Author.destroy_all
Tag.destroy_all
Recipe.destroy_all
Category.destroy_all

#Title,Directions,Quantity,Unit01,Ingredient01,Quantity02,Unit02,Ingredient02,Quantity03,Unit03,Ingredient03,Quantity04,Unit04,Ingredient04,Quantity05,Unit05,Ingredient05,Quantity06,Unit06,Ingredient06,Quantity07,Unit07,Ingredient07,Quantity08,Unit08,Ingredient08,Quantity09,Unit09,Ingredient09,Quantity10,Unit10,Ingredient10,Quantity11,Unit11,Ingredient11,Quantity12,Unit12,Ingredient12,Quantity13,Unit13,Ingredient13,Quantity14,Unit14,Ingredient14,Quantity15,Unit15,Ingredient15,Quantity16,Unit16,Ingredient16,Quantity17,Unit17,Ingredient17,Quantity18,Unit18,Ingredient18,Quantity19,Unit19,Ingredient19,Category
csv_file = Rails.root.join('db', 'recipes.csv')
csv_data = File.read(csv_file)

recipes = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

recipes.each do |recipe|
  recipe_name = recipe['Title']
  description = recipe['Directions']
  category_name = recipe['Category']
  ingredients = []

  # Find or create the category
  category = Category.find_or_create_by(name: category_name)
  next if category.blank?

  recipe_record = Recipe.create(name: recipe_name, description: description, category_id: category.id)

  # Create a random difficulty
  difficulty = ['easy', 'medium', 'hard'].sample

  RecipeDetail.create(
    servings: Faker::Number.between(from: 1, to: 10),
    difficulty: difficulty,
    cook_time: Faker::Number.between(from: 5, to: 180),
    recipe_id: recipe_record.id
  )

  # Create a random number of authors and tags for each recipe
  rand(1..5).times do
    author_name = Faker::Name.unique.name
    author = Author.find_or_create_by(name: author_name)
    recipe_record.authors << author
  end

  used_types = []  # Array to store unique restaurant types for this recipe

  rand(1..5).times do
    tag_name = nil
    loop do
      tag_name = Faker::Restaurant.type
      break unless used_types.include?(tag_name)
    end
    used_types << tag_name
    tag = Tag.find_or_create_by(name: tag_name)
    recipe_record.tags << tag
  end

  # Collect all ingredients and quantities
  (1..19).each do |i|
    quantity = recipe["Quantity#{format('%02d', i)}"]
    unit = recipe["Unit#{format('%02d', i)}"]
    measurement = "#{quantity&.gsub(/-.*/, '')} #{unit}".strip if quantity && unit
    ingredient = recipe["Ingredient#{format('%02d', i)}"]
    Ingredient.create(name: ingredient, measurement: measurement, recipe_id: recipe_record.id)
    break if measurement.blank? || ingredient.blank?
  end
end
