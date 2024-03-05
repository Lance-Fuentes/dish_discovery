require "application_system_test_case"

class RecipeTagsTest < ApplicationSystemTestCase
  setup do
    @recipe_tag = recipe_tags(:one)
  end

  test "visiting the index" do
    visit recipe_tags_url
    assert_selector "h1", text: "Recipe tags"
  end

  test "should create recipe tag" do
    visit recipe_tags_url
    click_on "New recipe tag"

    fill_in "Recipe", with: @recipe_tag.recipe_id
    fill_in "Tag", with: @recipe_tag.tag_id
    click_on "Create Recipe tag"

    assert_text "Recipe tag was successfully created"
    click_on "Back"
  end

  test "should update Recipe tag" do
    visit recipe_tag_url(@recipe_tag)
    click_on "Edit this recipe tag", match: :first

    fill_in "Recipe", with: @recipe_tag.recipe_id
    fill_in "Tag", with: @recipe_tag.tag_id
    click_on "Update Recipe tag"

    assert_text "Recipe tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe tag" do
    visit recipe_tag_url(@recipe_tag)
    click_on "Destroy this recipe tag", match: :first

    assert_text "Recipe tag was successfully destroyed"
  end
end
