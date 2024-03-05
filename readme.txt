Model: Category (maps to db table categories) (db always plural, model always singular)
    id (integer - auto incrementing PK) --rails proper generates automatically -same with date created, updated
    name (string)

Routes (uses Http verbs):
GET /categories       => categories#index (collection route - loads all the categories)
GET /categories/:id   => categories#show  (member route - eg. /categories/2)

Controller: CatogoriesController
- action: index (when /categories routes is called in url the categories#index/action controller gets invoked) (routes to the controller)
- action: show

Views:
- index     /app/view/categories/index.html.erb
- show      /app/view/categories/show.html.erb

-------
Model: Recipe 
    id (integer - auto incrementing PK)
    categoryId (Category FK)
    name (string)
    description (string)
    created_at (timestamp)
    updated_at (timestamp)

Routes (uses Http verbs):
GET /recipes           => recipes#index (collection route - loads all the recipes)
GET /recipes/:id       => recipes#show  (member route - eg. /recipes/2)

Controller: RecipesController
- action: index
- action: show

Views:
- index     /app/view/recipes/index.html.erb
- show      /app/view/recipes/show.html.erb

-------

Model: Ingredient
    id (integer - auto incrementing PK)
    recipeId (Recipe FK)
    name (string)
    measurement (string)

Routes (uses Http verbs):
GET /ingredients           => ingredients#index (collection route - loads all the ingredients)
GET /ingredients/:id       => ingredients#show  (member route - eg. /ingredients/2)

Controller: IngredientsController
- action: index
- action: show

Views:
- index     /app/view/ingredients/index.html.erb
- show      /app/view/ingredients/show.html.erb

-------

Model: RecipeDetail (one-to-one relationship with Recipe)
    id (integer - auto incrementing PK)
    recipeId (Recipe FK)
    servings (integer)
    difficulty (string)
    cookTime (string)

Routes (uses Http verbs):
GET /recipes/:id/detail    => recipedetails#show (loads the recipe detail for a specific recipe)

Controller: RecipeDetailsController
- action: show

Views:
- show      /app/view/recipedetails/show.html.erb

-------

Model: Author
    id (integer - auto incrementing PK)
    name (string)

Routes (uses Http verbs):
GET /authors           => authors#index (collection route - loads all the authors)
GET /authors/:id       => authors#show  (member route - eg. /authors/2)

Controller: AuthorsController
- action: index
- action: show

Views:
- index     /app/view/authors/index.html.erb
- show      /app/view/authors/show.html.erb

-------

Model: RecipeAuthor (join table for many-to-many relationship between Recipes and Authors)
    id (integer - auto incrementing PK)
    recipeId (Recipe FK)
    authorId (Author FK)

-------

Model: Tag
    id (integer - auto incrementing PK)
    name (string)

Routes (uses Http verbs):
GET /tags           => tags#index (collection route - loads all the tags)
GET /tags/:id       => tags#show  (member route - eg. /tags/2)

Controller: TagsController
- action: index
- action: show

Views:
- index     /app/view/tags/index.html.erb
- show      /app/view/tags/show.html.erb

-------

Model: RecipeTag (join table for many-to-many relationship between Recipes and Tags)
    id (integer - auto incrementing PK)
    recipeId (Recipe FK)
    tagId (Tag FK)