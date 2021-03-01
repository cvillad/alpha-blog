class CategoriesController < ApplicationController
  def index 
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was succesfuly created"
      redirect_to @category
    else
      render :new
    end
  end

  def show 
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end 