class RecipesController < ApplicationController
  before_filter :authorize

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).paginate(page: params[:page], per_page: 5) 
    @labels = Label.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
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
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
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
