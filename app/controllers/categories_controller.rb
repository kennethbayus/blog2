class CategoriesController < ApplicationController

  before_action :require_user, except:[:show]
  before_action :set_category, except:[:new, :create]

  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category=Category.new(category_params)
    @categories = Category.all
    
		if @category.save
  		flash['success'] = "New Category created successfully"
  		redirect_to new_category_path
  	else
  		render :new
  	end

  end

  def destroy
    if @category.destroy
      flash['success'] = "Category was deleted successfully"
    end
    redirect_to new_category_path
  end

  def edit
  end

  def update

	 	if @category.update(category_params)
  		flash['success'] = "Category was updated successfully"
  		redirect_to new_category_path
  	else
  		render :edit
  	end
	end

  def set_category
    @category = Category.find(params[:id])
  end

  private

  def category_params()
    params.require(:category).permit(:name)
  end

end
