class RecipesController < ApplicationController
  before_filter :authorize

  def index
    @recipes = Recipe.all.paginate(page: params[:page], per_page: 2)
    @labels = Label.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @labels = @recipe.labels
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(whitelisted_recipe_params)
    if @recipe.save
      flash[:recipe] = @recipe.id
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(whitelisted_recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      @errors = @recipe.errors.full_messages
    end
  end

  def destroy
    flash.now[:notice] = "Delete operation failed" unless Recipe.destroy(params[:id])
    redirect_to :action => :index
  end

  def whitelisted_recipe_params
    params.require(:recipe).permit(:title, :body)
  end
end
