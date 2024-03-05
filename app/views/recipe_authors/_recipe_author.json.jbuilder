json.extract! recipe_author, :id, :recipe_id, :author_id, :created_at, :updated_at
json.url recipe_author_url(recipe_author, format: :json)
