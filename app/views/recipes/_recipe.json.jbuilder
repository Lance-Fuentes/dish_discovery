json.extract! recipe, :id, :category_id, :name, :description, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
