require "test_helper"

class RecipeAuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_author = recipe_authors(:one)
  end

  test "should get index" do
    get recipe_authors_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_author_url
    assert_response :success
  end

  test "should create recipe_author" do
    assert_difference("RecipeAuthor.count") do
      post recipe_authors_url, params: { recipe_author: { author_id: @recipe_author.author_id, recipe_id: @recipe_author.recipe_id } }
    end

    assert_redirected_to recipe_author_url(RecipeAuthor.last)
  end

  test "should show recipe_author" do
    get recipe_author_url(@recipe_author)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_author_url(@recipe_author)
    assert_response :success
  end

  test "should update recipe_author" do
    patch recipe_author_url(@recipe_author), params: { recipe_author: { author_id: @recipe_author.author_id, recipe_id: @recipe_author.recipe_id } }
    assert_redirected_to recipe_author_url(@recipe_author)
  end

  test "should destroy recipe_author" do
    assert_difference("RecipeAuthor.count", -1) do
      delete recipe_author_url(@recipe_author)
    end

    assert_redirected_to recipe_authors_url
  end
end
