class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: [:edit, :update, :destroy]

#initiate new category
def new
    @category = current_user.categories.build
end

#index all categories
def index
    @categories = current_user.categories
end

#show category
def show
    redirect_to action: "index"
end

#create new category
def create
    @category = current_user.categories.build(category_params)

    begin @category.save!
        flash[:notice] = "Category successfully created."
        redirect_to @category 
    rescue
        flash[:alert] = 'All fields must be filled before a category can be created.'
        render :new 
    end
end

#find editable category
def edit
    @category = current_user.categories.find(params[:id])
end

#update category
def update
    if @category.update(category_params)
        redirect_to @category, notice: 'Category successfully updated.'
    else
        render :edit
    end
end

#delete category
def destroy
    @category.destroy
    redirect_to action: "index", notice: 'Category was successfully deleted.'
end

private
    def set_category
        @category = current_user.categories.find_by(id: params[:id])
    end

    def category_params
        params.require(:category).permit(:category_title, :category_description, :user_id)
    end
end
