require "application_system_test_case"

class RecipeAuthorsTest < ApplicationSystemTestCase
  setup do
    @recipe_author = recipe_authors(:one)
  end

  test "visiting the index" do
    visit recipe_authors_url
    assert_selector "h1", text: "Recipe authors"
  end

  test "should create recipe author" do
    visit recipe_authors_url
    click_on "New recipe author"

    fill_in "Author", with: @recipe_author.author_id
    fill_in "Recipe", with: @recipe_author.recipe_id
    click_on "Create Recipe author"

    assert_text "Recipe author was successfully created"
    click_on "Back"
  end

  test "should update Recipe author" do
    visit recipe_author_url(@recipe_author)
    click_on "Edit this recipe author", match: :first

    fill_in "Author", with: @recipe_author.author_id
    fill_in "Recipe", with: @recipe_author.recipe_id
    click_on "Update Recipe author"

    assert_text "Recipe author was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe author" do
    visit recipe_author_url(@recipe_author)
    click_on "Destroy this recipe author", match: :first

    assert_text "Recipe author was successfully destroyed"
  end
end
