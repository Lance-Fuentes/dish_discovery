json.extract! recipe_detail, :id, :recipe_id, :servings, :difficulty, :cookTime, :created_at, :updated_at
json.url recipe_detail_url(recipe_detail, format: :json)
