json.extract! ingredient, :id, :recipe_id, :name, :measurement, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
