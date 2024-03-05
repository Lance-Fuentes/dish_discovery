require "application_system_test_case"

class RecipeDetailsTest < ApplicationSystemTestCase
  setup do
    @recipe_detail = recipe_details(:one)
  end

  test "visiting the index" do
    visit recipe_details_url
    assert_selector "h1", text: "Recipe details"
  end

  test "should create recipe detail" do
    visit recipe_details_url
    click_on "New recipe detail"

    fill_in "Cooktime", with: @recipe_detail.cookTime
    fill_in "Difficulty", with: @recipe_detail.difficulty
    fill_in "Recipe", with: @recipe_detail.recipe_id
    fill_in "Servings", with: @recipe_detail.servings
    click_on "Create Recipe detail"

    assert_text "Recipe detail was successfully created"
    click_on "Back"
  end

  test "should update Recipe detail" do
    visit recipe_detail_url(@recipe_detail)
    click_on "Edit this recipe detail", match: :first

    fill_in "Cooktime", with: @recipe_detail.cookTime
    fill_in "Difficulty", with: @recipe_detail.difficulty
    fill_in "Recipe", with: @recipe_detail.recipe_id
    fill_in "Servings", with: @recipe_detail.servings
    click_on "Update Recipe detail"

    assert_text "Recipe detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe detail" do
    visit recipe_detail_url(@recipe_detail)
    click_on "Destroy this recipe detail", match: :first

    assert_text "Recipe detail was successfully destroyed"
  end
end
