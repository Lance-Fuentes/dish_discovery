require "test_helper"

class RecipeDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_detail = recipe_details(:one)
  end

  test "should get index" do
    get recipe_details_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_detail_url
    assert_response :success
  end

  test "should create recipe_detail" do
    assert_difference("RecipeDetail.count") do
      post recipe_details_url, params: { recipe_detail: { cookTime: @recipe_detail.cookTime, difficulty: @recipe_detail.difficulty, recipe_id: @recipe_detail.recipe_id, servings: @recipe_detail.servings } }
    end

    assert_redirected_to recipe_detail_url(RecipeDetail.last)
  end

  test "should show recipe_detail" do
    get recipe_detail_url(@recipe_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_detail_url(@recipe_detail)
    assert_response :success
  end

  test "should update recipe_detail" do
    patch recipe_detail_url(@recipe_detail), params: { recipe_detail: { cookTime: @recipe_detail.cookTime, difficulty: @recipe_detail.difficulty, recipe_id: @recipe_detail.recipe_id, servings: @recipe_detail.servings } }
    assert_redirected_to recipe_detail_url(@recipe_detail)
  end

  test "should destroy recipe_detail" do
    assert_difference("RecipeDetail.count", -1) do
      delete recipe_detail_url(@recipe_detail)
    end

    assert_redirected_to recipe_details_url
  end
end
