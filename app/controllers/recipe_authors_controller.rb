class RecipeAuthorsController < ApplicationController
  before_action :set_recipe_author, only: %i[ show edit update destroy ]

  # GET /recipe_authors or /recipe_authors.json
  def index
    @recipe_authors = RecipeAuthor.all
  end

  # GET /recipe_authors/1 or /recipe_authors/1.json
  def show
  end

  # GET /recipe_authors/new
  def new
    @recipe_author = RecipeAuthor.new
  end

  # GET /recipe_authors/1/edit
  def edit
  end

  # POST /recipe_authors or /recipe_authors.json
  def create
    @recipe_author = RecipeAuthor.new(recipe_author_params)

    respond_to do |format|
      if @recipe_author.save
        format.html { redirect_to recipe_author_url(@recipe_author), notice: "Recipe author was successfully created." }
        format.json { render :show, status: :created, location: @recipe_author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_authors/1 or /recipe_authors/1.json
  def update
    respond_to do |format|
      if @recipe_author.update(recipe_author_params)
        format.html { redirect_to recipe_author_url(@recipe_author), notice: "Recipe author was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_authors/1 or /recipe_authors/1.json
  def destroy
    @recipe_author.destroy!

    respond_to do |format|
      format.html { redirect_to recipe_authors_url, notice: "Recipe author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_author
      @recipe_author = RecipeAuthor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_author_params
      params.require(:recipe_author).permit(:recipe_id, :author_id)
    end
end
