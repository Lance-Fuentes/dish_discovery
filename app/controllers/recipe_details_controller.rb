class RecipeDetailsController < ApplicationController
  before_action :set_recipe_detail, only: %i[ show edit update destroy ]

  # GET /recipe_details or /recipe_details.json
  def index
    @recipe_details = RecipeDetail.all
  end

  # GET /recipe_details/1 or /recipe_details/1.json
  def show
  end

  # GET /recipe_details/new
  def new
    @recipe_detail = RecipeDetail.new
  end

  # GET /recipe_details/1/edit
  def edit
  end

  # POST /recipe_details or /recipe_details.json
  def create
    @recipe_detail = RecipeDetail.new(recipe_detail_params)

    respond_to do |format|
      if @recipe_detail.save
        format.html { redirect_to recipe_detail_url(@recipe_detail), notice: "Recipe detail was successfully created." }
        format.json { render :show, status: :created, location: @recipe_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_details/1 or /recipe_details/1.json
  def update
    respond_to do |format|
      if @recipe_detail.update(recipe_detail_params)
        format.html { redirect_to recipe_detail_url(@recipe_detail), notice: "Recipe detail was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_details/1 or /recipe_details/1.json
  def destroy
    @recipe_detail.destroy!

    respond_to do |format|
      format.html { redirect_to recipe_details_url, notice: "Recipe detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_detail
      @recipe_detail = RecipeDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_detail_params
      params.require(:recipe_detail).permit(:recipe_id, :servings, :difficulty, :cookTime)
    end
end
